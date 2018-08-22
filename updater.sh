#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_----------------------------------------------+"
echo -e "|   Adversarial Informatics Combat Tool Updater    |"
echo -e "|               cygienesolutions.com               |"
echo -e "|              [Usage]: ./updater.sh               |"
echo -e "+--------------------------------------------------+"
echo -e "${NC}"
#if [ $# == 0 ] ; then
#    exit 1; fi



####  Update Metasploit
echo -e "${GREEN}"
echo -e "Updating metasploit..."
echo -e "${NC}"
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add
apt-get update
apt install metasploit-framework


#### Update Nmap
echo -e "${GREEN}"
echo -e "Updating nmap..."
echo -e "${NC}"
apt-get install nmap


#### Update Exploit DB Archive
echo -e "${GREEN}"
echo -e "Updating exploitdb..."
echo -e "${NC}"
cd /usr/share/exploitdb
searchsploit -u

#cd /usr/share/exploitdb
#wget https://github.com/offensive-security/exploit-database/archive/master.zip
#unzip -o master.zip
#cd /usr/share/exploitdb/platforms
#echo -e "${GREEN}"
#echo -e "Deleting existing exploit archive..."
#echo -e "${NC}"
#rm -rf *
#cd /usr/share/exploitdb//exploit-database-master/exploits
#echo -e "${GREEN}"
#echo -e "Copying the latest exploit archive..."
#echo -e "${NC}"
#date
#mv * /usr/share/exploitdb/platforms
#echo -e "${GREEN}"
#echo -e "Done"
#echo -e "Cleaning up..."
#echo -e "${NC}"
#cd /usr/share/exploitdb
#echo -e "${NC}"
#rm master*


echo -e "Goodbye."

