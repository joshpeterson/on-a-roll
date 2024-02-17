#if defined(ENABLE_TESTS)
#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"
#endif

#include <random>

template <int M, int N> class Matrix {
public:
  Matrix() { data = new float[M * N]; }

  ~Matrix() { delete[] data; }

  float& operator()(int i, int j) { return data[i * N + j]; }
  float operator()(int i, int j) const { return data[i * N + j]; }

  int numberOfRows() const { return M; }
  int numberOfColumns() const { return N; }

private:
  float* data;
};

// From https://stackoverflow.com/a/36527160
static float randomFloat() {
  static std::default_random_engine e;
  static std::uniform_real_distribution<> dis(0, 1);
  return dis(e);
}

template <int M, int N> Matrix<M, N> randomMatrix() {
  Matrix<M, N> matrix;
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      matrix(i, j) = randomFloat();
    }
  }
  return matrix;
}

template <int M, int N>
Matrix<M, N> matMul(const Matrix<M, N>& left, const Matrix<N, M>& right) {
  Matrix<M, N> result;
  for (int i = 0; i < left.numberOfRows(); i++) {
    for (int j = 0; j < right.numberOfColumns(); j++) {
      result(i, j) = 0;
      for (int k = 0; k < left.numberOfColumns(); k++) {
        result(i, j) += left(i, k) * right(k, j);
      }
    }
  }
  return result;
}

// Taken from the Google Benchmark library
template <class Tp> inline void DoNotOptimize(Tp& value) {
  asm volatile("" : "+r,m"(value) : : "memory");
}

#if !defined(ENABLE_TESTS)
int main(int argc, char* argv[]) {
  const int N = 1024;

  Matrix<N, N> left = randomMatrix<N, N>();
  Matrix<N, N> right = randomMatrix<N, N>();
  Matrix<N, N> result = matMul(left, right);
  DoNotOptimize(result(0, 0));

  return 0;
}
#endif

#if defined(ENABLE_TESTS)
TEST_CASE("Verify Matrix behavior") {
  SUBCASE("Matrix can be constructed and filled with values") {
    Matrix<2, 2> m;
    m(0, 0) = 1;
    m(0, 1) = 2;
    m(1, 0) = 3;
    m(1, 1) = 4;

    CHECK(m(0, 0) == 1);
    CHECK(m(0, 1) == 2);
    CHECK(m(1, 0) == 3);
    CHECK(m(1, 1) == 4);
  }

  SUBCASE("Matrix has the proper number of rows and columns") {
    Matrix<2, 3> m;
    CHECK(m.numberOfRows() == 2);
    CHECK(m.numberOfColumns() == 3);
  }
}

TEST_CASE("Verify matMul behavior") {
  SUBCASE("matMul returns the correct result") {
    Matrix<2, 2> left;
    left(0, 0) = 1;
    left(0, 1) = 2;
    left(1, 0) = 3;
    left(1, 1) = 4;

    Matrix<2, 2> right;
    right(0, 0) = 5;
    right(0, 1) = 6;
    right(1, 0) = 7;
    right(1, 1) = 8;

    Matrix result = matMul(left, right);

    CHECK(result(0, 0) == 19);
    CHECK(result(0, 1) == 22);
    CHECK(result(1, 0) == 43);
    CHECK(result(1, 1) == 50);
  }
}
#endif

