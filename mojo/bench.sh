#!/bin/sh
./build.sh
hyperfine --warmup 3 ./matmul ./matmul_unrolled4 ./matmul_unrolled8 ./matmul_unrolled16 ./matmul_unrolled32