
#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------------+"
echo -e "|  Adversarial Informatics Combat HTTP Macro Enumeration  |"
echo -e "|                   cygienesolutions.com                  |"
echo -e "|              [Usage]: ./macro_http_enum <IP>            |"
echo -e "+---------------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Supply an IP address as the first argument and MHE will"
    echo -e "spawn the enumeration tools you need."
    echo ""
    echo -e "Example: ./macro_http_enum.sh 10.10.21.21"
    echo -e "${NC}"
    exit 1; fi

IP=$1
vulns=$(ls /usr/share/nmap/scripts/http-* | xargs -n 1 basename | paste -sd "," -)

set +m
gnome-terminal -e "nmap -sTV -p80,443 -vv --script=$vulns $IP"&
gnome-terminal -e "davtest -url http://$IP"&
gnome-terminal -e "nikto -h http://$IP"&
gnome-terminal -e "dirb http://$IP"&
gnome-terminal -e "curl -i -X OPTIONS http://$IP"&

