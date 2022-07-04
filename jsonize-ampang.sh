#!/usr/bin/bash

raw_data=($(lynx -dump https://www.e-solat.gov.my/index.php?r=esolatApi/TakwimSolat\&period=today\&zone=SGR01|jq  -r '.prayerTime[]|.hijri,.date,.day,.imsak,.fajr,.syuruk,.dhuhr,.asr,.maghrib,.isha'))
arrayLen=${#raw_data[@]}
arrayWaq=("Tarikh Hijrah" "Tarikh Masihi" "Hari" "Imsak" "Subuh" "Syuruk" "Zuhur" "Asar" "Maghrib" "Isyak")

echo '-------------------JADUAL WAKTU BAGI AMPANG/HULU LANGAT KOD SGR01-------'
for ((i=0;i<${arrayLen};i++)); do echo "${arrayWaq[$i]}, ${raw_data[$i]}"; done
