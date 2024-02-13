# Results 

## Outer loop unrolling

Benchmark 1: ./matmul
  Time (mean ± σ):     361.3 ms ±   3.1 ms    [User: 342.3 ms, System: 2.0 ms]
  Range (min … max):   357.3 ms … 368.2 ms    10 runs
 
Benchmark 2: ./matmul_unrolled4
  Time (mean ± σ):     387.7 ms ±   1.7 ms    [User: 369.3 ms, System: 1.9 ms]
  Range (min … max):   384.9 ms … 389.9 ms    10 runs
 
Benchmark 3: ./matmul_unrolled8
  Time (mean ± σ):     389.7 ms ±   5.2 ms    [User: 373.5 ms, System: 1.7 ms]
  Range (min … max):   376.6 ms … 394.3 ms    10 runs
 
Benchmark 4: ./matmul_unrolled16
  Time (mean ± σ):     394.7 ms ±   1.5 ms    [User: 376.3 ms, System: 1.8 ms]
  Range (min … max):   392.4 ms … 396.7 ms    10 runs
 
Benchmark 5: ./matmul_unrolled32
  Time (mean ± σ):     422.0 ms ±   2.4 ms    [User: 403.4 ms, System: 1.9 ms]
  Range (min … max):   416.3 ms … 425.6 ms    10 runs
 
Summary
  ./matmul ran
    1.07 ± 0.01 times faster than ./matmul_unrolled4
    1.08 ± 0.02 times faster than ./matmul_unrolled8
    1.09 ± 0.01 times faster than ./matmul_unrolled16
    1.17 ± 0.01 times faster than ./matmul_unrolled32

## Inner loop unrolling

Benchmark 1: ./matmul
  Time (mean ± σ):     362.0 ms ±   4.1 ms    [User: 341.3 ms, System: 1.8 ms]
  Range (min … max):   356.0 ms … 371.9 ms    10 runs
 
Benchmark 2: ./matmul_unrolled4
  Time (mean ± σ):     128.2 ms ±   3.9 ms    [User: 108.6 ms, System: 1.6 ms]
  Range (min … max):   124.4 ms … 143.4 ms    21 runs
 
Benchmark 3: ./matmul_unrolled8
  Time (mean ± σ):     116.2 ms ±   4.1 ms    [User: 98.3 ms, System: 1.6 ms]
  Range (min … max):   102.8 ms … 119.4 ms    24 runs
 
Benchmark 4: ./matmul_unrolled16
  Time (mean ± σ):     114.3 ms ±   3.9 ms    [User: 95.3 ms, System: 1.6 ms]
  Range (min … max):   104.1 ms … 125.7 ms    22 runs
 
Benchmark 5: ./matmul_unrolled32
  Time (mean ± σ):     114.3 ms ±   2.9 ms    [User: 95.3 ms, System: 1.6 ms]
  Range (min … max):   109.3 ms … 121.7 ms    23 runs
 
Summary
  ./matmul_unrolled32 ran
    1.00 ± 0.04 times faster than ./matmul_unrolled16
    1.02 ± 0.04 times faster than ./matmul_unrolled8
    1.12 ± 0.04 times faster than ./matmul_unrolled4
    3.17 ± 0.09 times faster than ./matmul