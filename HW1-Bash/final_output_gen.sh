#!/bin/bash
#generates final output
#echo "Sr.Num.,RollNum,Name,part A,part B,Total,IsTied:Yes-No" > final_output.csv
sr=1
awk -F, 'NR==FNR{partB[$1]=$2;
				  rollNum[$1]=$1;
				  #print $1"....." $1;
				  next;
				 } 
		 NF{if(rollNum[$1]-i==$1-i)
			 {
				print partB[$1]
				print $0 
			 
			 }  
			 else
			 {
				print "NC\r"
				print $0 
				
			 }
			 
			}' partB.csv partA.csv | paste - - | tr -d "\r" | tr "\t" ","  | awk -F, '{
					print $0
					print $1+$3
					close("final_output.csv")
				}' | paste - - | tr -d "\r" | tr "\t" ","  |sort -t, -nr -k3 | awk -F, '{
					if(!NF || !seen[$4]++)
					{
							print $0",No"
					}
					else
					{
							print $0",Yes"
					}
					
					}' 

