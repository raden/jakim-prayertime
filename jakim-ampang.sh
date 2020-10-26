#!/bin/bash 

raw_data=( $(lynx -dump -width 300 "https://www.e-solat.gov.my/index.php?r=esolatApi/xmlfeed&zon=SGR01" | sed 's/^\s*//g' ) )
location=$(echo ${raw_data[@]} | sed 's/.*\(Gombak.*S.Alam\).*/\1/g')
my_array=( $(echo ${raw_data[@]}| cut -d" " -f13- )  ) 
arrayLen=${#my_array[@]}
arrayWaq=("Imsak" "Subuh" "Syuruk" "Zuhur" "Asar" "Maghrib" "Isyak")

echo '--------------------------'
echo -n
echo 'WAKTU SOLAT BAGI AMPANG UNTUK '${location}
echo '--------------------------'
for ((i=0;i<${arrayLen};i++)); do echo "${arrayWaq[$i]}, ${my_array[$i]}"; done
echo -n
echo '--------------------------'
