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

echo "------------------------------------------------------------------------------------------------------------------------"

HH=0
HT=0
TH=0
TT=0
for (( i=1; i<=a; i++ ))
do
        n=$((RANDOM%2))
	p=$((RANDOM%2))
        if [ $n -eq 0 ]
        then
                doublet1[$i]="H"
        else
                doublet1[$i]="T"
        fi
 	if [ $p -eq 0 ]
        then
                doublet2[$i]="H"
        else
                doublet2[$i]="T"
        fi
done
for (( i=1; i<=a-1; i++ ))
do
        for (( j=i+1; j<a; j++ ))
	do
		if [ "${doublet1[$i]}""${doublet2[$j]}" == "HH" ]
        	then
			echo "HH"
              		((HH++))
        	elif [ "${doublet1[$i]}""${doublet2[$j]}" == "HT" ]
		then
			echo "HT"
                	((HT++))
		elif [ "${doublet1[$i]}""${doublet2[$j]}" == "TH" ]
		then
			echo "TH"
			((TH++))
		elif [ "${doublet1[$i]}""${doublet2[$j]}" == "TT" ]
		then
			echo "TT"
			((TT++))
        	fi
	done
done
Total=`expr $HH + $HT + $TH + $TT`
perHH=`expr $HH \* 100 / $Total`
perHT=`expr $HT \* 100 / $Total`
perTH=`expr $TH \* 100 / $Total`
perTT=`expr $TT \* 100 / $a`
echo "Flipping of Doublet"
echo "HH : $HH : $perHH"
echo "HT : $HT : $perHT"
echo "TH : $TH : $perTH"
echo "TT : $TT : $perTT"
if [[ $HH -ge $HT && $HH -ge $TH && $HH -ge $TT ]]
then
        echo "Winning Combination is HH with $perHH %"
elif [[ $HT -ge $HH && $HT -ge $TH && $HT -ge $TT ]]
then
        echo "Winning Combination is HT with $perHT %"
elif [[ $TH -ge $HH && $TH -ge $HT && $TH -ge $TT ]]
then
        echo "Winning Combination is TH with $perTH %"
elif [[ $TT -ge $HH && $TT -ge $TH && $TT -ge $HT ]]
then
        echo "Winning Combination is HH with $perHH %"

fi


