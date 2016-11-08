#!/bin/bash

javac ThreadSpawner.java
strace -ff -r -o java_ltrace java ThreadSpawner
