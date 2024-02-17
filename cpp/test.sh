#!/bin/sh
set -e

SOURCE_FILE="matmul.cpp"
DEFAULT_OPTIONS="-std=c++20 -g -O0 -DENABLE_TESTS"
SANITIZER_OPTIONS="-fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer -fno-strict-overflow"

# Create the build directory if it doesn't exist.
mkdir -p build

# The set-x here prints the command that is being executed to stdout.
(set -x; clang++ $DEFAULT_OPTIONS $SANITIZER_OPTIONS $SOURCE_FILE -o build/"${SOURCE_FILE%.*}"_test)

# Run the tests.
./build/matmul_test

