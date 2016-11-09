#!/bin/bash

cd ${0%/*}

# compile
make

##################
# thread_spawner
# strace
strace -f -r -o log/cpp_concurrent_strace_out.log ./thread_spawner.bin

# ltrace
ltrace -f -r -o log/cpp_concurrent_ltrace_out.log ./thread_spawner.bin

##################
# non_concurrent

# strace
strace -f -r -o log/cpp_nonconcurrent_strace_out.log ./non_concurrent.bin

# ltrace
ltrace -f -r -o log/cpp_nonconcurrent_ltrace_out.log ./non_concurrent.bin
