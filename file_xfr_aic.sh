#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------------+"
echo -e "|  Adversarial Informatics Combat File Transfer Automata  |"
echo -e "|                   cygienesolutions.com                  |"
echo -e "|          [Usage]: ./file_xfr_aic.sh <SERVERTYPE>        |"
echo -e "+---------------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Current file transfer server  types: http|ftp|smb"
    echo ""
    echo -e "Example: ./file_xfr_aic.sh http"
    echo -e "${NC}"
    exit 1; fi

SERVERTYPE=$1
LOCALIP=$(ifconfig eth0 | grep 'inet' | cut -d: -f2 | awk '{print $2}')

if [ "$SERVERTYPE" == "http" ]; then
	echo -e "${GREEN}"
	echo -e "Starting Python-based Web Server: http://$LOCALIP:8080"
	echo -e "${NC}"
	python -m SimpleHTTPServer 8080

elif [ "$SERVERTYPE" == "ftp"  ]; then
        echo -e "${GREEN}"
        echo -e "Setting up FTP Server on: ftp://$LOCALIP:21"
        echo -e "${NC}"
	apt-get -qq install python-pyftpdlib
	python -m pyftpdlib -p 21 -w --username=ftp --password=ftp --directory=/usr/share/windows-binaries/

elif [ "$SERVERTYPE" == "smb"  ]; then
        echo -e "${GREEN}"
        echo -e "Starting Impacket SMB Server on: smb://$LOCALIP:445"
        echo -e "${NC}"
	python /usr/share/doc/python-impacket/examples/smbserver.py TOOLS /usr/share/windows-binaries/

else
        echo "Please provide a useful file transfer server type."
	echo "Current Sniff Types: http|ftp|smb"

fi






