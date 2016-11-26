cd ${0%/*}

# clear
rm $2 2>/dev/null

#strace
for ((n=0;n<100;n++))
do
	echo "$1 iteration $n"
	./strace_fn.sh "$1" "$2"
done
