#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat Auxiliary Tool:   |"
echo -e "|                Clean UP ARP Spoof                 |" 
echo -e "|               cygienesolutions.com                |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"

#Clean up ARP Spoof

echo -e "${GREEN}"
echo -e "Cleaning up ARP Spoof Attack..."
ps -aux | grep arpspoof > aic_procs.rsc
for PID in $(cat aic_procs.rsc | grep -v grep | awk '{print $2}')
do
	kill -9 $PID
done
echo -e "Done."

echo -e "Cleaning up SSL Attack..."
ps -aux | grep sslstrip > aic_procs.rsc
for PID in $(cat aic_procs.rsc | grep -v grep | awk '{print $2}')
do
        kill -9 $PID
done
echo -e "Done."

echo ""
echo -e "{Ӧ Support Free Information Ӧ}"
echo -e "${NC}"

