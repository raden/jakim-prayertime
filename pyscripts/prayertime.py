#!/usr/bin/python3

# Author: Khairulnizam ( @steelburn )

import requests
import feedparser
import sys
from lxml import html


def getptimes(areacode):
    url = 'https://www.e-solat.gov.my/index.php?r=esolatApi/xmlfeed&zon='+areacode
    d = feedparser.parse(url)
    print('Waktu Solat Untuk',d.feed.description)
    print('-----------------------------------')
    for i in range(len(d.entries)):
        print(d.entries[i].title,"\t",d.entries[i].summary)

def listcodes():
    pageContent=requests.get('https://www.e-solat.gov.my/index.php')
    tree = html.fromstring(pageContent.content)
    locations = tree.xpath('//*[@id="inputzone"]/optgroup/option/text()')
    print(*locations, sep = "\n")

if len(sys.argv) > 1:
    getptimes(sys.argv[1])
else:
    print('\n\nNo area code given. Printing out area code list:')
    print('------------------------------------------------')
    listcodes()
    print('\nThis command expects 1 argument, which is the area code.\n')
