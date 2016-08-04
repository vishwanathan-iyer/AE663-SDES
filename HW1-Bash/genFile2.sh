#!/bin/bash
echo "RollNum,Marks" > part2.csv
pass=20
for i in $( tail -n +2 $1) 
do
		
       	if [$( cut -d',' -f2 $i)  -gt $pass ]
	then
	  	echo $i >> part2.csv

	fi
        #echo  $i | cut -d',' -f2
        #echo 
done

