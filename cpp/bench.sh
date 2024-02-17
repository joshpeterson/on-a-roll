#!/bin/sh
set -e

./build.sh
(set -x; hyperfine --warmup 3 ./build/matmul)
