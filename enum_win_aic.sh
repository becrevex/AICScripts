#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat WIN Enumeration   |"
echo -e "|             cygienesolutions.com                  |"
echo -e "|     [Usage]: ./win_aic_enum.sh <TARGET> <PORT>    |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    exit 1; fi

IP="$1"
##PORT="$2"
SCRIPTPATH=`dirname $(realpath $0)`
mkdir ./$IP
echo $SCRIPTPATH

echo -e "${GREEN}"
echo -e "Performing NetBIOS Scan..."
echo -e "${NC}"
nbtscan $IP

echo -e "${GREEN}"
echo -e "Performing NSE vulnerability scan for Windows/SMB..."
echo -e "${NC}"
# Performing standard nmap Windows enumeration on target...
nmap -n -vv -Pn -sV $IP -pT:139,445,U:137 --script='smb-*' -oA $IP/smb_enum_$IP-$PORT.aic 
#nmap -n -vv -Pn -sV $IP -pT:139,445,U:137 --script=nbstat,smb-enum-domains,smb-enum-groups,smb-enum-processes,smb-enum-sessions,smb-ls,smb-mbenum,smb-os-discovery,smb-print-text,smb-security-mode,smb-server-stats,smb-system-info -oA $IP/smb_enum_$IP-$PORT.aic

#echo -e "${GREEN}"
#echo -e "Performing nmap vulnerability Windows scan..."
#echo -e "${NC}"
# Performing nmap vulnerability Windows scan on target...
#nmap -n -vv -Pn -sV $IP -pT:139,445,U:137 --script=smb-vuln-conficker.nse,smb-vuln-cve2009-3103.nse,smb-vuln-cve-2017-7494.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse,smb-vuln-regsvc-dos.nse,smb-double-pulsar-backdoor.nse -oA $IP/smb_vulns_$IP-$PORT.aic

#echo -e "${GREEN}"
#echo -e "Running enum4linux Windows enumeration..."
#echo -e "${NC}"
# Performing standard nmap Windows enumeration on target...
#enum4linux $IP | tee $IP/enum4linux_$IP

#echo -e "${GREEN}"
#echo -e "Running smbclient enumeration..."
#echo -e "${NC}"
# Performing standard nmap Windows enumeration on target...
#smbclient -L\\ -N -I $IP | tee $OUTPUT/smbclient_$IP

#echo -e "${GREEN}"
#echo -e "Running Ncrack to brute force the Windows Administrator account..."
#echo -e "${NC}"
# Performing standard nmap Windows enumeration on target...
#ncrack -vv --user Administrator -P /usr/share/wordlists/rockyou.txt rdp://$IP\n

