#!/bin/bash
lynx -source "https://www.e-solat.gov.my/index.php?r=esolatApi/xmlfeed&zon=$1" > /tmp/solat.xml
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
/tmp/solat.xml
