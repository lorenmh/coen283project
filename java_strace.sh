#!/bin/bash

javac ThreadSpawner.java
strace -f -r -o java_strace.log java ThreadSpawner
