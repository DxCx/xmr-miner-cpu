#!/bin/env bash

set -x

git clone https://github.com/wolf9466/cpuminer-multi
cd cpuminer-multi/
./autogen.sh
CFLAGS="-march=native" ./configure
make

./minerd -a $ALGO -o $URL -u $USERNAME -p $PASSWORD -t $numthreads
