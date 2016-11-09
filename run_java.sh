#!/bin/bash

cd ${0%/*}

##################
# ThreadSpawner
# compile
javac ThreadSpawner.java

# strace
strace -f -r -o log/java_concurrent_strace_out.log java ThreadSpawner

# ltrace
ltrace -f -r -o log/java_concurrent_ltrace_out.log java ThreadSpawner

##################
# NonConcurrent
# compile
javac ThreadInheritance.java

# strace
strace -f -r -o log/java_threadinheritance_strace_out.log java ThreadInheritance

# ltrace
ltrace -f -r -o log/java_threadinheritance_ltrace_out.log java ThreadInheritance

##################
# NonConcurrent
# compile
javac NonConcurrent.java

# strace
strace -f -r -o log/java_nonconcurrent_strace_out.log java NonConcurrent

# ltrace
ltrace -f -r -o log/java_nonconcurrent_ltrace_out.log java NonConcurrent
