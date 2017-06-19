#!/usr/bin/ruby -w
require 'nokogiri'
require 'open-uri'
require 'rexml/document'
include REXML

doc = Nokogiri::XML(open('http://www2.e-solat.gov.my/xml/today/?zon=SGR01')) 

Zones=[]
doc.xpath('//item').each do|zone|
Zones << {"Waktu"=>zone.xpath('title').text, "Pukul"=>zone.xpath('description').text}
end

puts Zones

expression="//item/title"
nodes=doc.xpath(expression)

expression2="//item/description"
nodes2=doc.xpath(expression2)

for i in 0..7 do
puts nodes.children[i],nodes2.children[i]
end
