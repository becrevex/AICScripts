#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_------------------------------------------------+"
echo -e "|     Adversarial Informatics DNS Reconnaissance     |"
echo -e "|               cygienesolutions.com                 |"
echo -e "|        [Usage]: ./recon_dns_aic.sh <domain>        |"
echo -e "+----------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "Description:"
    echo -e "Performs automated, thorough DNS Enumeration on a provided domain name."
    echo -e "all generated data and content is located in the local directory under"
    echo -e "the specified hostname provided."
    echo -e "${GREEN}"
    echo -e "[Usage]: ./recon_dns_aic.sh <domain>"
    echo -e "${NC}"
    exit 1; fi

DOMAIN=$1
stamp=$(date)
#+"%m:%d:%Y")
SCRIPTPATH=`dirname $(realpath $0)`
mkdir ./$DOMAIN
#echo $SCRIPTPATH
echo "Performing DNS Recon on: " $DOMAIN
echo "Tool sequence: theharvester, metagoofil, recon-ng"
echo ""
echo "Date/Time: " $stamp

#Running classic whois
#Running the Harvester
echo -e "${GREEN}"
echo -e "[+] Running classic qhois query..."
echo -e "${NC}"
whois $DOMAIN | tee $DOMAIN/$DOMAIN.whois.recon
echo "Done."

#Running the Harvester
echo -e "${GREEN}"
echo -e "[+] Running theharvester to gather domain names..."
echo -e "${NC}"
theharvester -d $DOMAIN -l 500 -b all -t -n -v | tee $DOMAIN/$DOMAIN.harvest.recon
echo "Done."

#Running Metagoofil on the domain
echo -e "${GREEN}"
echo -e "[+] Running Metagoofil to search for documents (doc,pdf,txt,xls,docx,xlsx)..."
echo -e "${NC}"
python /opt/metagoofil/metagoofil.py -d $DOMAIN -t doc,pdf,txt,xls,docx,xlsx -l 500 -n 50 -o files | tee $DOMAIN/$DOMAIN.meta.recon
echo "Done."

#Running recon-ng automation script
echo -e "${GREEN}"
echo -e "[+] Running recon-ng for advanced domain enumeration..."
echo -e "${NC}"
echo Target: $DOMAIN
echo ""
echo "workspaces select $DOMAIN" > /opt/CTFScripts/run.resource
echo ""
echo "set TIMEOUT 100" >> /opt/CTFScripts/run.resource
echo "use recon/domains-hosts/hackertarget" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "set TIMEOUT 100" >> /opt/CTFScripts/run.resource
echo "use recon/domains-hosts/baidu_site" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/domains-hosts/bing_domain_web" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/domains-hosts/google_site_web" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/domains-hosts/netcraft" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/domains-hosts/yahoo_domain" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/domains-hosts/vpnhunter" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/domains-hosts/brute_hosts" >> /opt/CTFScripts/run.resource
echo "set WORDLIST /usr/share/recon-ng/data/sorted_knock_dnsrecon_fierce_recon-ng.txt" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/netblocks-companies/whois_orgs" >> /opt/CTFScripts/run.resource
echo "set SOURCE $DOMAIN" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use recon/hosts-hosts/resolve" >> /opt/CTFScripts/run.resource
echo "set SOURCE default" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "use reporting/list" >> /opt/CTFScripts/run.resource
echo "set FILENAME /opt/CTFScripts/$DOMAIN/$DOMAIN.lst" >> /opt/CTFScripts/run.resource
echo "set COLUMN host" >> /opt/CTFScripts/run.resource
echo "run" >> /opt/CTFScripts/run.resource
echo ""
echo "exit" >> /opt/CTFScripts/run.resource
sleep 1
echo ""
recon-ng --no-check -r /opt/CTFScripts/run.resource

#Running DNSEnum on the domain
echo -e "${GREEN}"
echo -e "[+] Running DNSEnum..."
echo -e "${NC}"
dnsenum -v -r --enum $DOMAIN  | tee $DOMAIN/$DOMAIN.dnsenum.recon
echo "Done."

#Running DNSRecon on the domain
echo -e "${GREEN}"
echo -e "[+] Running DNSRecon..."
echo -e "${NC}"
dnsrecon -d $DOMAIN -a -s -z -t std,rvl,brt,srv,axfr,tld,snoop --threads 5 -D "/opt/SecLists/Discovery/DNS/subdomains-top1mil-5000.txt" | tee $DOMAIN/$DOMAIN.dnsrecon.recon
echo "Done."

#Running domLink on the domain
echo -e "${GREEN}"
echo -e "[+] Running domLink.py..."
echo -e "${NC}"
python /opt/DomLink/domLink.py -v -C $DOMAIN | tee $DOMAIN/$DOMAIN.domlink.recon
echo "Done."

#Running Fierce intense DNS brute force on the domain
echo -e "${GREEN}"
echo -e "[+] Running Fierce intense DNS brute force on the domain..."
echo -e "${NC}"
fierce -dns $DOMAIN -prefix /opt/SecLists/Discovery/DNS/subdomains-top1m | tee $DOMAIN/$DOMAIN.fierce.recon


# Consolidating into one file..
echo -e "${GREEN}"
echo -e "[+] Consolidating into one file..."
echo -e "${NC}"
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.lst >> $DOMAIN/$DOMAIN.recon
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.whois.recon >> $DOMAIN/$DOMAIN.recon
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.harvest.recon >> $DOMAIN/$DOMAIN.recon
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.dnsenum.recon >> $DOMAIN/$DOMAIN.recon
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.dnsrecon.recon >> $DOMAIN/$DOMAIN.recon
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.domlink.recon >> $DOMAIN/$DOMAIN.recon
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.fierce.recon >> $DOMAIN/$DOMAIN.recon
cat /opt/CTFScripts/$DOMAIN/$DOMAIN.meta.recon >> $DOMAIN/$DOMAIN.recon
echo "Done."
