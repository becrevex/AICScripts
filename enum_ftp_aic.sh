#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+------------------------------------------------+"
echo -e "| Adversarial Informatics Combat FTP Enumeration |"
echo -e "|            cygienesolutions.com                |"
echo -e "|    [Usage]: ./ftp_aic_enum.sh <TARGET> <PORT>  |"
echo -e "+------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "Currently performs all NSE ftp-* service enumeration on the provided"
    echo -e "target system and port specification.  Output is stored in a local"
    echo -e "directory named after the target specification provided.
    exit 1; fi

IP="$1"
PORT="$2"
SCRIPTPATH=`dirname $(realpath $0)`
mkdir ./$IP
##OUTPUT="$SCRIPTPATH/$IP/"

echo $SCRIPTPATH

echo -e "${GREEN}"
echo -e "Performing standard nmap enumeration and vulnerability identification..."
echo -e "${NC}"
## Perform standard nmap enumeration and vulnerability identification
#nmap -n -Pn -vv -sV $IP -p $PORT --script=ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 -oA ./$IP/ftp_$IP-$PORT.aic
nmap -n -Pn -vv -sV $IP -p $PORT --script='ftp-*' -oA ./$IP/ftp_$IP.aic
echo -e "${GREEN}"
echo -e "Brute forcing the target..."
echo -e "${NC}"
## Perform hydra brute force ont the target
hydra -L /usr/share/metasploit-framework/data/wordlists/unix_users.txt -P /usr/share/metasploit-framework/data/wordlists/unix_passwords.txt -f -o ./$IP/ftphydra_$IP-$PORT -u $IP -s $PORT ftp

