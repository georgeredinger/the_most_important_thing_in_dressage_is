#!/bin/bash
echo > users.txt
for i  in {1..1000} ; do 
	curl -s "http://barnbynotes.com/open-notebooks/$i" | grep -o -m 1 "/users/.*\"" | sed "s/\".*//"  >> users.txt
done


