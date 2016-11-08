#!/bin/bash

javac ThreadSpawner.java
ltrace -f -r -o java_ltrace.log java ThreadSpawner
