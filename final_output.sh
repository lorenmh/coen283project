#!/bin/bash

cd ${0%/*}

python sort.py log/java_concurrent_strace_out.log csv/jc.csv
python sort.py log/java_nonconcurrent_strace_out.log csv/jn.csv
python sort.py log/java_threadinheritance_strace_out.log csv/ji.csv
python sort.py log/cpp_concurrent_strace_out.log csv/cc.csv
python sort.py log/cpp_nonconcurrent_strace_out.log csv/cn.csv
