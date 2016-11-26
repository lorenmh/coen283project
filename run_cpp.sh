#!/bin/bash

cd ${0%/*}

# compile
make

##################
# thread_spawner

./test_fn.sh ./thread_spawner.bin log/cpp_concurrent_strace_out.log

##################
# non_concurrent

./test_fn.sh ./non_concurrent.bin log/cpp_nonconcurrent_strace_out.log
