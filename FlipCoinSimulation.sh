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
		((H++))
	else
		((T++))
	fi
done
perH=`expr $H \* 100 / $a`
perT=`expr $T \* 100 / $a`
echo "Flipping of Singlet"
echo "H : $h : $perH"
echo "T : $t : $perT"
if [ $H -ge $T ]
then
	echo "Winning Combination is H with $perH %"
else
	echo "Winning Combination is T with $perT %"
fi

echo "--------------------------------------------------------------------------------------------------------------------------------------------"

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
for (( i=1; i<a-1; i++ ))
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

echo "-------------------------------------------------------------------------------------------------------------------------------------------"

HHH=0
HHT=0
HTH=0
HTT=0
TTT=0
THT=0
THH=0
TTH=0
for (( i=1; i<=a; i++ ))
do
        n=$((RANDOM%2))
        p=$((RANDOM%2))
        q=$((RANDOM%2))
	if [ $n -eq 0 ]
        then
                triplet1[$i]="H"
        else
                triplet1[$i]="T"
        fi
        if [ $p -eq 0 ]
        then
                triplet2[$i]="H"
        else
                triplet2[$i]="T"
        fi
	if [ $q -eq 0 ]
        then
                triplet3[$i]="H"
        else
                triplet3[$i]="T"
        fi

done
for (( i=1; i<a-2; i++ ))
do
        for (( j=i+1; j<a-1; j++ ))
        do
		for(( k=j+1; k<a; k++ ))
		do
                	if [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "HHH" ]
                	then
                        	echo "HHH"
                        	((HHH++))
                        elif [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "HHT" ]
                        then
                                echo "HHT"
                                ((HHT++))
                        elif [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "HTH" ]
                        then
                                echo "HTH"
                                ((HTH++))
                        elif [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "THH" ]
                        then
                                echo "THH"
                                ((THH++))
                        elif [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "HTT" ]
                        then
                                echo "HTT"
                                ((HTT++))
                        elif [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "THT" ]
                        then
                                echo "THT"
                                ((THT++))
                        elif [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "TTH" ]
                        then
                                echo "TTH"
                                ((TTH++))
                        elif [ "${triplet1[$i]}""${triplet2[$j]}""${triplet3[$k]}" == "TTT" ]
                        then
                                echo "TTT"
                                ((TTT++))
                	fi
		done
        done
done
Total=`expr $HHH + $HHT + $HTH + $HTT + $TTT + $THT + $THH + $TTH`
perHHH=0
perHHH=`expr $HHH \* 100 / $Total`
perHHT=0
perHHT=`expr $HHT \* 100 / $Total`
perHTH=0
perHTH=`expr $HTH \* 100 / $Total`
PerHTT=0
perHTT=`expr $HTT \* 100 / $Total`
PerTTT=0
perTTT=`expr $TTT \* 100 / $Total`
PerTHT=0
perTHT=`expr $THT \* 100 / $Total`
perTHH=0
perTHH=`expr $THH \* 100 / $Total`
perTTH=0
perTTH=`expr $TTH \* 100 / $Total`
echo "Flipping of Triplet"
echo "HHH : $HHH : $perHHH"
echo "HHT : $HHT : $perHHT"
echo "HTH : $HTH : $perHTH"
echo "HTT : $HTT : $perHTT"
echo "TTT : $TTT : $perTTT"
echo "THT : $THT : $perTHT"
echo "THH : $THH : $perTHH"
echo "TTH : $TTH : $perTTH"
declare -A array
max=0
array=([HHH]=$HHH [HHT]=$HHT [HTH]=$HTH [HTT]=$HTT [TTT]=$TTT [THT]=$THT [THH]=$THH [TTH]=$TTH)
for i in ${!array[@]}
do
	if [[ $i -gt $max ]]
	then
		max=$i
		maxed=${array[$i]}
		echo "$max : $maxed"
	fi
done
