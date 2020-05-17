#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics NMAP SMB Attack Scriptk  |"
echo -e "|               cygienesolutions.com                |"
echo -e "|        [Usage]: ./atk_smb_vuln.sh  <filename>     |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Enumerates SMB LHF using nmap and NSE"
    echo -e ""
    echo -e "[Usage]: ./atk_smb_vuln.sh hosts"
    echo -e "${NC}"
    exit 1; fi

FILENAME="$1"
TARGET="$2"
LOCALIP=$(ifconfig $INTERFACE | grep 'inet' | cut -d: -f2 | awk '{print $2}')

nmap -n -vv -Pn -sV -iL $FILENAME -pT:139,445,U:137 --script='smb-*' -oA smb_vuln_report


echo -e "${GREEN}"
echo -e "Executing SecurityHighliter..."
echo -e "${NC}"


cat smb_vuln_report.nmap | egrep --color -E '1999|2000|2001|Anonymous|anonymous|unathorized|telnet|upload|writable|Samba|admin|Admin|Administrator|VULNERABLE|vulnerable|CVE-|directory|Interesting|<DIR>|robots.txt|default|listable|Full|Open|open|^'
