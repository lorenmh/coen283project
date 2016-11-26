#!/bin/bash

strace -f -r $1 2>&1 \
	| egrep 'clone\(' \
	| egrep -v unfinished \
	| sed 's/^.*\([0-9]*\.[0-9]*\).*$/\1/' \
	| tr '\n' ',' \
	>> $2

echo >> $2
