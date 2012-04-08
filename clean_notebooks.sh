#!/bin/bash
for f in *.html; do
  sed '1,/class="author-name"/d' "$f"  \
		| sed '/class="grid_3 omega"/,$d' \
		| sed 's/<[^>]*>//g' \
		| sed 's/\&nbsp;//g' \
		| sed '/^$/d'| sed 's/^[ \t]*//' \
		| sed '/›/d' \
		| sed '/»/d' \
		| fmt -w 1 \
    | sed  's/^[a-zA-Z0-9]{1,3}$//'
done

