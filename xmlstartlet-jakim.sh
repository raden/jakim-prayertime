#!/bin/bash

SASARAN=/tmp/solat.xml

if [[ -z $1 ]]; then
echo "Sila letak kod lokasi"
echo "Cara guna, $0 <kod lokasi>"
echo -n
exit
fi

lynx -source "https://www.e-solat.gov.my/index.php?r=esolatApi/xmlfeed&zon=$1" > $SASARAN
xmlstarlet sel -T -t -n \
-o "------------------------------" -n \
-o "Kawasan: " \
-m "//channel" -v "link" -n  \
-o "Tarikh: " \
-m "//channel" -v "dc:date" -n  \
-o "------------------------------" -n \
-t -m "//item" -o "Waktu: " -v "title" \
-o " -- " \
-o "Masa: " -v "description" -n  \
$SASARAN
