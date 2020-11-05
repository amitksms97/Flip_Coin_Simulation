#!/bin/bash/
n=$((RANDOM%2))
if [ $n -eq 0 ]
then
	echo "Head"
else
	echo "Tail"
fi
