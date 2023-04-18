#!/bin/bash

set -xe
g++ src/*.cpp -std=c++17 -o fn
mv fn ~/Applications/fn/fn
echo "export PATH=$PATH:~/Applications/fn/" >> ~/.bashrc



