#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+------------------------------------------------+"
echo -e "|   Adversarial Informatics Combat Web Spider    |"
echo -e "|            cygienesolutions.com                |"
echo -e "|       [Usage]: ./web_aic_spider.sh <URL>       |"
echo -e "+------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    exit 1; fi

URL=$1

#Scrape the site for URL's with wget
wget -q $URL -O - | \
    tr "\t\r\n'" '   "' | \
    grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | \
    sed -e 's/^.*"\([^"]\+\)".*$/\1/g' > urls.rsc



#wget --spider --force-html -r -l2 $URL 2>&1 \
#  | grep '^--' | awk '{ print $3 }' \
#  | grep -v '\.\(css\|js\|png\|gif\|jpg\)$' \
#  > urls.m3uwget --spider --force-html -r -l2 $URL 2>&1 \
#  | grep '^--' | awk '{ print $3 }' \
#  | grep -v '\.\(css\|js\|png\|gif\|jpg\)$'

#  > urls.m3u
