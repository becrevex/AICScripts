#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat HTTP Enumeration  |"
echo -e "|             cygienesolutions.com                  |"
echo -e "|     [Usage]: ./http_aic_enum.sh <TARGET> <PORT>   |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    exit 1; fi

IP="$1"
PORT=80
SCRIPTPATH=`dirname $(realpath $0)`
mkdir ./$IP
echo $SCRIPTPATH

echo -e "${GREEN}"
echo -e "Performing standard nmap HTTP enumeration..."
echo -e "${NC}"
# Performing standard nmap HTTP enumeration on target...
#nmap -n -vv -Pn -sV $IP -p 80,81,90,8080,9090,8000,9000,443 --script=http-enum,http-userdir-enum,http-apache-negotiation,http-backup-finder,http-config-backup,http-default-accounts,http-methods,http-method-tamper,http-passwd,http-robots.txt,http-iis-webdav-vuln,http-vuln-cve2009-3960,http-vuln-cve2010-0738,http-vuln-cve2011-3368,http-vuln-cve2012-1823,http-vuln-cve2013-0156,http-waf-detect,http-waf-fingerprint,ssl-enum-ciphers,ssl-known-key -oN $IP/http_$IP.nmap
nmap -n -vv -Pn -sV $IP -p 80,443,81,8080 --script='http-*' -oA ./$IP/http_$IP


echo -e "${GREEN}"
echo -e "Running nikto on the target..."
echo -e "${NC}"
## Run nikto on the target system
nikto -h http://$IP -p $PORT | tee $IP/nikto_$IP-$PORT

echo -e "${GREEN}"
echo -e "Running gobuster for RobotsDisallowed on the target..."
echo -e "${NC}"
## Run gobuster on the target system
gobuster -u http://$IP:$PORT/ -w /usr/share/seclists/Discovery/Web_Content/Top1000-RobotsDisallowed.txt | tee $IP/gobuster_top1000_$IP:$PORT

echo -e "${GREEN}"
echo -e "Running gobuster for common directories on the target..."
echo -e "${NC}"
## Run gobuster on the target system
gobuster -u http://$IP:$PORT/ -w /usr/share/seclists/Discovery/Web_Content/common.txt | tee $IP/gobuster_common_$IP-$PORT


