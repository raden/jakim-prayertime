#!/bin/bash -l

#my_array=( $(lynx -dump http://www2.e-solat.gov.my/xml/today/?zon=SGR01|\
my_array=( $(lynx -dump "https://www.e-solat.gov.my/index.php?r=esolatApi/xmlfeed&zon=SGR01"|\
cut --complement -d "," -f 1,3,4|\
grep -v H.S|cut --complement -d "M" -f 1) )

printf "$my_array\n\n"
arrayLen=${#my_array[@]}
arrayWaq=("Imsak" "Subuh" "Syuruk" "Zuhur" "Asar" "Maghrib" "Isyak")

echo '--------------------------'
echo -n
echo 'WAKTU SOLAT BAGI AMPANG UNTUK '${my_array[0]}
echo '--------------------------'
for ((i=2;i<${arrayLen};i++)); do echo "${arrayWaq[$i-2]}, ${my_array[$i]}"; done
echo -n
echo '--------------------------'
