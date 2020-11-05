#!/bin/bash/
read -p "Enter the times you want to flip the coin" a
declare -A singlet
for (( i=1; i<=a; i++ ))
do
	n=$((RANDOM%2))
	if [ $n -eq 0 ]
	then
		echo "Head"
		singlet[$i]="H"
	else
		echo "Tail"
		singlet[$i]="T"
	fi
done
for (( i=1; i<=a; i++ ))
do
	if [ "${singlet[$i]}" = "H" ]
	then
		((h++))
	else
		((t++))
	fi
done
perH=`expr $h \* 100 / $a`
perT=`expr $t \* 100 / $a`
echo "Flipping of Singlet"
echo "H : $h : $perH"
echo "T : $t : $perT"
if [ $h -ge $t ]
then
	echo "Winning Combination is H with $perH %"
else
	echo "Winning Combination is T with $perT %"
fi
