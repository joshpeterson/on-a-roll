alias type = DType.float32
from random import rand


struct Matrix:
    var data: DTypePointer[type]
    var rows: Int
    var cols: Int

    # Initialize zeroeing all values
    fn __init__(inout self, rows: Int, cols: Int):
        self.data = DTypePointer[type].alloc(rows * cols)
        memset_zero(self.data, rows * cols)
        self.rows = rows
        self.cols = cols

    # Initialize taking a pointer, don't set any elements
    fn __init__(inout self, rows: Int, cols: Int, data: DTypePointer[DType.float32]):
        self.data = data
        self.rows = rows
        self.cols = cols

    # Initialize with random values
    @staticmethod
    fn rand(rows: Int, cols: Int) -> Self:
        let data = DTypePointer[type].alloc(rows * cols)
        rand(data, rows * cols)
        return Self(rows, cols, data)

    fn __getitem__(self, y: Int, x: Int) -> Float32:
        return self.load[1](y, x)

    fn __setitem__(self, y: Int, x: Int, val: Float32):
        return self.store[1](y, x, val)

    fn load[nelts: Int](self, y: Int, x: Int) -> SIMD[DType.float32, nelts]:
        return self.data.simd_load[nelts](y * self.cols + x)

    fn store[nelts: Int](self, y: Int, x: Int, val: SIMD[DType.float32, nelts]):
        return self.data.simd_store[nelts](y * self.cols + x, val)


alias N = 1024


fn matmul_naive(C: Matrix, A: Matrix, B: Matrix):
    for m in range(N):
        for k in range(N):

            @unroll(32)
            for n in range(N):
                C[m, n] += A[m, k] * B[k, n]


def main():
    var C = Matrix(N, N)
    var A = Matrix.rand(N, N)
    var B = Matrix.rand(N, N)

    matmul_naive(C, A, B)

    A.data.free()
    B.data.free()
    C.data.free()
