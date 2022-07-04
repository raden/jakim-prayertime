#!/usr/bin/bash -l

xmlstarlet sel --net -t -n \
-o "------------------------------" -n \
-o "Kawasan: " \
-m "//channel" -v "link" -n  \
-o "Tarikh: " \
-m "//channel" -v "dc:date" -n  \
-o "------------------------------" -n \
-t -m "//item" -o "Waktu: " -v "title" \
 -o " -- " \
-o "Masa: " -v "description" -n  \
"https://www.e-solat.gov.my/index.php?r=esolatApi/xmlfeed&zon=$1"
#http://www2.e-solat.gov.my/xml/today/?zon=$1
