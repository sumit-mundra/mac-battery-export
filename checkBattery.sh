#!/bin/sh
#value=`pmset -g rawbatt | grep 'FCC' |  awk -F ';' '{print $4}' | awk -F ':' '{print $1; print $2}' | awk -F '=' '{print $2}' | paste -sd "," -`
final=`pmset -g rawbatt | grep 'FCC' |sed 's/:/;/g' | cut -d ";" -f 4,5,6,10 |sed 's/ //g' | tr ';' '\n' | cut -d '=' -f 2 | tr '\n' ',' | sed 's/.$//' `
i=`perl -MTime::HiRes=gettimeofday -MPOSIX=strftime -e '($s,$us) = gettimeofday(); printf "%d.%06d\n", $s, $us'`
echo "$i,$final" >> $1


