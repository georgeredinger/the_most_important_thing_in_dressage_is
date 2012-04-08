#!/bin/bash
for notebook  in notebook_[0-9]*.html ; do 
  notebook_string=`echo $notebook | sed -e 's/^notebook_//' -e 's/\.html//'`
	notebook_id=`echo "$notebook_string" | bc`
  grep 'class="pager-last last"'  "$notebook" \
    | grep "/open-notebooks/[0-9]*?page="  \
		| sed 's/^.*href=\"//' \
		| sed 's/".*$//' \
		| sort -u \
		| while read url ; do
			max=`echo $url | sed 's/^.*=//'`
			for i in `seq  1 "$max"`; do
        page_name="notebook_$notebook_id""_page_$i.html"
        echo "http://barnbynotes.com/open-notebooks/$notebook_id?page=$i"
				curl -s "http://barnbynotes.com/open-notebooks/$notebook_id?page=$i" > "notebook_$notebook_id""_page_$i.html"
			done	
		done
done


