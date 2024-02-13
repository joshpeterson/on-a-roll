#!/bin/sh
for i in matmul*.mojo; do
    mojo build $i
done