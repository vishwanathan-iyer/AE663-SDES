#!/bin/bash
#Generates PartB
#echo "RollNum,Name,partB" > $2
awk -F"," '{
	if(NR!=1)
	{
		
		if($3-i >= 20.0)  
		{
			print $1 "," $2 "," $3 
			
		}			
	}
}' $1 >> $2

cat $2
