#!/usr/bin/ruby -w
#  A Ruby-based JAKIM solat time parser by Muhammad Najmi Ahmad Zabidi
#  Updated on Nov, 2019
require 'nokogiri'
require 'open-uri'

#doc = Nokogiri::XML(open("http://www2.e-solat.gov.my/xml/today/?zon=#{ARGV[0]}")) 
doc = Nokogiri::XML(open("https://www.e-solat.gov.my/index.php?r=esolatApi/xmlfeed&zon=#{ARGV[0]}")) 
printf "\n"

expression0="//link"
nodes0=doc.xpath(expression0)

expression="//item/title"
nodes=doc.xpath(expression)

expression2="//item/description"
nodes2=doc.xpath(expression2)

expression3="//channel/dc:date"
nodes3=doc.xpath(expression3)

printf "------------------------------------------"
printf "\nJadual Solat Pada : %s "% nodes3.children 
printf "\nuntuk kawasan: %s "% nodes0.children 
printf "\n------------------------------------------"
for i in 0..6 do
printf "\nWaktu %s: \%s" % [nodes.children[i],nodes2.children[i]]
end
printf "\n"
printf "------------------------------------------"
printf "\n\n"
