#!/bin/bash

cd ${0%/*}



##################
# ThreadSpawner
# compile
javac ThreadSpawner.java

./test_fn.sh 'java ThreadSpawner' log/java_concurrent_strace_out.log

##################
# NonConcurrent
# compile
javac ThreadInheritance.java

./test_fn.sh 'java ThreadInheritance' log/java_threadinheritance_strace_out.log

##################
# NonConcurrent
# compile
javac NonConcurrent.java

./test_fn.sh 'java NonConcurrent' log/java_nonconcurrent_strace_out.log
