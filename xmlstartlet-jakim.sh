#http://www2.e-solat.gov.my/xml/today/?zon=SGR01
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
http://www2.e-solat.gov.my/xml/today/index.php?zon=$1
