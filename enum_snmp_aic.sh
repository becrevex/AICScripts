#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat SNMP Enumeration  |"
echo -e "|             cygienesolutions.com                  |"
echo -e "|     [Usage]: ./snmp_aic_enum.sh <TARGET> <PORT>   |"
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
echo -e "Performing standard nmap SNMP enumeration..."
echo -e "${NC}"
## Perform standard SNMP nmap enumeration
nmap -n -vv -Pn -sU $IP -p $PORT  --script=snmp-netstat,snmp-processes -oN $IP/$IP:$PORT_snmp.nmap

echo -e "${GREEN}"
echo -e "Running onesixtyone on the target..."
echo -e "${NC}"
## Run onesixtyone on the target system
onesixtyone -c public $IP | tee $IP/161_$IP-$PORT

echo -e "${GREEN}"
echo -e "A series of snmpwalks the target..."
echo -e "${NC}"
## Running snmpwalk for users, ports, processes, and software
snmpwalk -c public -v1 $IP | tee $IP/snmpwalk_$IP-$PORT
snmpwalk -c public -v1 $IP 1.3.6.1.4.1.77.1.2.25 | tee $IP/snmp_users_$IP-$PORT
snmpwalk -c public -v1 $IP 1.3.6.1.2.1.6.13.1.3 | tee $IP/snmp_ports_$IP-$PORT
snmpwalk -c public -v1 $IP 1.3.6.1.2.1.25.4.2.1.2 | tee $IP/snmp_process_$IP-$PORT
snmpwalk -c public -v1 $IP 1.3.6.1.2.1.25.6.3.1.2 | tee $IP/snmp_software_$IP-$PORT

