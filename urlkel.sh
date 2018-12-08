#!/bin/bash

#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_---------------------------------------------+"
echo -e "|    Adversarial Informatics Combat Web Scanner   |"
echo -e "|            cygienesolutions.com                 |"
echo -e "|       [Usage]: ./urlkel.sh <URL> <Depth>        |"
echo -e "+-------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Usage: ./urlkel.sh <url> <depth>"
    echo -e "${NC}"
    exit 1; fi

TARGET_URL=$1
SCAN_DEPTH=$2
COMMAND=$3
ARGUMENT=$4
MAP_FILE='url.map'
PARAM_FILE='urlp.txt'

get_url_map() {
    echo '' > $MAP_FILE
    echo -e "${GREEN}"
    echo -e "[+] Recursively spidering target: $TARGET_URL"
    echo -e "[+] Recursive depth: $SCAN_DEPTH"
    TIMESTAMP=$(date +%F_%T)
    echo -e "[+] Time of Execution: $TIMESTAMP"
    echo -e "${NC}"
    # spider the provided URL and output the result into a file (and stdout)
    wget --spider --force-html -r -l"${SCAN_DEPTH}" "${TARGET_URL}" 2>&1 | grep '^--' | awk '{ print $3 }' | sort | tee -a "${MAP_FILE}"
    echo -e "${GREEN}"
    echo -e "[+] Generating parameter url file: $PARAM_FILE"
    echo -e "${NC}"
    cat $MAP_FILE | grep '=' | uniq | awk -F'=' {'print $1'} | sed 's/$/=/' | sort | uniq  > $PARAM_FILE
    echo "Done."
    echo -e "${GREEN}"
    PCOUNT=$(cat $PARAM_FILE | wc -l)
    URLCOUNT=$(cat $MAP_FILE | wc -l)
    echo -e "[+] Collected urls: $URLCOUNT"
    echo -e "[+] Collected parameter urls: $PCOUNT"
    #cat $PARAM_FILE
    echo -e "${NC}"
}

download_file() {
        mkdir -p ./downloads
        echo -e "${GREEN}"
        echo -e "Downloading all files of type: $ARGUMENT"
        echo -e "Download folder: ./downloads/"
        echo -e "${NC}"
        cat $MAP_FILE | grep $ARGUMENT > download_list.txt
        parallel --gnu -a ./download_list.txt "wget -nv -P ./downloads/ {}"
	#Clean up
	rm ./download_list.txt
}

xss_scan() {
	echo "" > xss_results.txt
	for ARG in $(cat $PARAM_FILE);
	do
		echo Testing: $ARG
		GPARAM=$(echo $ARG | awk -F'/' {'print $NF'} | awk -F'=' {'print $1'} | sed 's/$/=/')
		#echo $GPARAM
		xsser -u $ARG --auto >> xss_results.txt
		#xsser -u $ARG -g $GPARAM --auto
        done
}


get_url_map


if [ "$COMMAND" == "download" ]; then
	download_file
elif [ "$COMMAND" == "xss" ]; then
	xss_scan
        cat xss_results.txt | grep Injection | uniq
        echo -e "${GREEN}"
        cat xss_results.txt | grep Injections: | uniq
        echo -e "${NC}"
else
	echo -e "${GREEN}"
	echo -e "${NC}"
fi
