/bin/bash -l

echo "Building $1"
clang++ "$1"
./a.out
