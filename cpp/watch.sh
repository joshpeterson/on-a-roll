#!/bin/sh
if [[ $OSTYPE == 'darwin'* ]]; then
  ag -l | entr -s 'gtime -f "Elapsed time for build and tests: %E" ./test.sh'
else
  ag -l | entr -s '/usr/bin/time -f "Elapsed time for build and tests: %E" ./test.sh'
fi
