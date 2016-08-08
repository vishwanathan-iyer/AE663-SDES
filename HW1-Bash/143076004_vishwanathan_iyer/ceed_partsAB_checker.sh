#bin/bash
###
# Exercise 2: 
# Name: Vishwanathan Iyer
# Roll No: 143076004
###
echo "rollnum,mark" > rollnum-marks.csv
for i in $(ls | egrep [0-9]| grep ".sh")
do
	dir=${i:0:9}
	mkdir -p "$dir" &&
	mv "$i" "$dir" 
done

for j in $(ls | egrep [0-9] )
do
	cp "./data/partA.csv" "./$j/" 2>/dev/null
	cp "./data/partB.csv" "./$j/" 2>/dev/null
	cp "./data/final-output-template.csv" "./$j" 2>/dev/null
done
for k in $(ls | egrep [0-9])
do
	cd $k 2>/dev/null
	bash "./$k.sh" 2>/dev/null
	check=$(diff -s "final-output.csv" "final-output-template.csv" 2>/dev/null | cut -d' ' -f6 )
	if [ "$check" == "identical" ]
	then
		echo "$k,10" >> ../rollnum-marks.csv
	else
		echo "$k,0" >> ../rollnum-marks.csv
	fi
	cd ..
done
