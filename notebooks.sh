#!/bin/bash
for i  in {1..2000} ; do 
	notebook_number=`printf "%04d" "$i"`
	curl -s "http://barnbynotes.com/open-notebooks/$i"  > "notebook_$notebook_number.html"
done


