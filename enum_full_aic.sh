#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_------------------------------------------------------+"
echo -e "|      Adversarial Informatics Combat FULL Enumeration     |"
echo -e "|                  cygienesolutions.com                    |"
echo -e "|    [Usage]: ./full_aic_enum.sh <KEY> <TARGET> <PORT>     |"
echo -e "+----------------------------------------------------------+"
echo -e " Try one of these keys:"
echo -e "     smb-vuln    smtp    rdp        critix "
echo -e "     smb         my-sql  broadcast  dns    "
echo -e "     http        ftp     ssh"
echo -e "     http-vulns  ssl     ms-sql"

echo -e "${NC}"
if [ $# == 0 ] ; then
    exit 1; fi

KEY="$1"
TARGET="$2"
PORT="$3"
mkdir full_enum

echo -e "${GREEN}"
echo -e " [+] Performing full nmap bulk enumeration with the following NSE scripts..."
ls /usr/share/nmap/scripts/*$KEY* | xargs -n 1 basename
echo -e "${NC}"
# Performing standard nmap mmssql enumeration on target...
vulns=`ls /usr/share/nmap/scripts/*$KEY* | xargs -n 1 basename | paste -sd "," -`;nmap -Pn -vv -sTV -p $PORT -vv --script=$vulns $TARGET -oN ./full_enum/full_aic_$TARGET-$PORT.nmap


