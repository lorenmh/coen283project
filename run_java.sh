#!/bin/bash

##################
# ThreadSpawner
# compile
javac ThreadSpawner.java

# strace
strace -f -r -o log/java_strace_out.log java ThreadSpawner

# ltrace
ltrace -f -r -o log/java_ltrace_out.log java ThreadSpawner

##################
# NonConcurrent
# compile
javac NonConcurrent.java

# strace
strace -f -r -o log/java_nonconcurrent_strace_out.log java NonConcurrent

# ltrace
ltrace -f -r -o log/java_nonconcurrent_ltrace_out.log java NonConcurrent
