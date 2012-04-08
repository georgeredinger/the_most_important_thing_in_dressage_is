#!/bin/bash
echo > notebooks.txt
for i  in {1..1000} ; do 
	notebook_number=`printf "%04d" "$i"`
	curl -s "http://barnbynotes.com/open-notebooks/$i"  > "notebook_$notebook_number.html"
done


