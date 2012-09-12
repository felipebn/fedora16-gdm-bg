#!/bin/bash


xml=/usr/share/backgrounds/verne/default/verne.xml
imgname=`basename $1`
newimg="/usr/share/backgrounds/images/$imgname"
newimg=`echo "$newimg" | awk '{gsub(/\//,"\\\/");print}'`

if [ -e $1 ]; then
	cp $1 /usr/share/backgrounds/images/
	sed "s/\(<size.*>\)\(.*\)\(<\/size>\)/\1"$newimg"\3/g" $xml -i
else
	echo "$1: arquivo nao encontrado"
fi
