#bin/bash
###
# Exercise 2: 
# Name: Vishwanathan Iyer
# Roll No: 143076004
###
for i in $(ls | egrep [0-9,R,D,P]| grep ".sh")
do
	dir=${i:0:9}
	mkdir -p "$dir" &&
	mv "$i" "$dir" 
done

for j in $(ls | egrep [0-9,R,D,P])
do
	cp "./data/partA.csv" "./$j/"
	cp "./data/partB.csv" "./$j/"
	cp "./data/final-output-template.csv" "./$j/"
done

for k in $(ls | egrep [0-9,R,D,P])
do
	cd $k
	sh "./$k.sh"
	check=$(diff -s "final-output.csv" "final-output-template.csv" | cut -d' ' -f6 )
	if [ "$check" == "identical" ]
	then
		echo "$k,10" >> ../rollnum-marks.csv
	else
		echo "$k,0" >> ../rollnum-marks.csv
	fi
	cd ..
done
