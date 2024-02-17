#!/bin/sh
set -e

SOURCE_FILE="matmul.cpp"
DEFAULT_OPTIONS="-std=c++20 -g -O3"

# Create the build directory if it doesn't exist.
mkdir -p build

# The set-x here prints the command that is being executed to stdout.
(set -x; g++-13 $DEFAULT_OPTIONS $SOURCE_FILE -o build/"${SOURCE_FILE%.*}")
