#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat MX Relay Locator  |"
echo -e "|               cygienesolutions.com                |"
echo -e "|             [Usage]: ./mx_aic_loc.sh              |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
#if [ $# == 0 ] ; then
#    exit 1; fi

# Need a way to locate seemingly random MX hosts

#Using Shodan -- Needs a bigger host pool
echo -e "${GREEN}"
echo -e "Locating SMTP Services with Shodan..."
echo -e "${NC}"
shodan search --fields ip_str,port,org,hostnames SMTP > results.rsc
cat results.rsc | awk {'print $1'} > mxhosts.rsc
echo -e "${GREEN}"
echo -e "Done."
echo -e "${NC}"


#Using nmap random IP generator
echo -e "${GREEN}"
echo -e "Locating SMTP Services with Nmap..."
echo -e "${NC}"
nmap -vvv -Pn -sS -p25,465,587 -iR 121 --open -oG mx_host_search.rsc
cat mx_hosts_search.rsc | awk {'print $1'} >> mxhosts.rsc
echo -e "${GREEN}"
echo -e "Done."
echo -e "${NC}"


nmap -vvv --script smtp-open-relay.nse -p25,465,587 -iL ./mxhosts.rsc -oA mx_relay_report


IP="$1"
PORT=80
SCRIPTPATH=`dirname $(realpath $0)`
mkdir ./$IP
echo $SCRIPTPATH

