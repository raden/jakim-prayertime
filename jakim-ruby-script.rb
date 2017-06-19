#!/usr/bin/ruby -w
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::XML(open('http://www2.e-solat.gov.my/xml/today/?zon=SGR01')) 

Zones=[]
doc.xpath('//item').each do|zone|
Zones << {"Waktu"=>zone.xpath('title').text, "Masa"=>zone.xpath('description').text}
end

puts Zones

printf "\n\n\n"

expression="//item/title"
nodes=doc.xpath(expression)

expression2="//item/description"
nodes2=doc.xpath(expression2)

expression3="//channel/dc:date"
nodes3=doc.xpath(expression3)

printf "------------------------------------------"
printf "\nJadual Solat Pada : %s "% nodes3.children 
printf "\n------------------------------------------"
for i in 0..6 do
printf "\nWaktu %s: \%s" % [nodes.children[i],nodes2.children[i]]
end
printf "\n"
printf "------------------------------------------"
printf "\n\n"

