#!/bin/bash

javac ThreadSpawner.java
strace -f -r -o java_strace_out.log java ThreadSpawner
