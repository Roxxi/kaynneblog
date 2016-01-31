#!/bin/bash
# Download pictures from wordpress.

echo "hello world!"


urls=`grep -i "www.kaynne.com" ../content/post/* | sed -ne 's/.*\(http[^\")]*\).*/\1/p'`

for u in $urls
do
	p="$(echo $u | sed -ne 's/.*\/\(20.*\..*\)/\1/p')"
	d="$(echo $p | sed -ne 's|\([0-9]*/[0-9]*\/\).*|\1|p')"
	echo $u
	echo $p
	echo $d
	mkdir -p "$d"
	curl $u > $p

done
