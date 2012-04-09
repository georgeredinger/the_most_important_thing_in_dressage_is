#!/bin/bash
for f in notebook_*.html; do
  sed '1,/class="content clear-block"/d' "$f"  \
		| sed '/name="read-and-post"/,$d' \
		| sed '/<script type="text\/javascript"/,/<\/script>/d' \
		| sed 's/<[^>]*>//g' \
		| fmt -w 1 \
		| sed 's/\&.*\;//' \
		| sed 's/^[ »›\r\n]*//' \
	  | sed '/[\,\.\+\-\!]/d' \
		| sed '/^[a-zA-Z][a-zA-Z]$/d' \
		| sed '/^[a-zA-Z]$/d' \
		| sed '/^M/d' \
		| sed '/^\n\n$/d' \
		| sed '/^\n$/d' \
		| sed 's/^[ \t]*//;s/[ \t]*$//' \
    | sed '/.\{3\}/!d'
done 

#for f in *.html; do
#  sed '1,/class="author-name"/d' "$f"  \
#		| sed '/class="grid_3 omega"/,$d' \
#		| sed 's/<[^>]*>//g' \
#		| sed 's/\&nbsp;//g' \
#		| sed '/^$/d'| sed 's/^[ \t]*//' \
#		| sed '/›/d' \
#		| sed '/»/d' \
#		| fmt -w 1 \
#    | sed  's/^[a-zA-Z0-9]{1,3}$//'
#done

