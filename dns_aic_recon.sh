#! /bin/sh

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics DNS Recon & Enumeration  |"
echo -e "|               cygienesolutions.com                |"
echo -e "|            [Usage]: ./dns_aic_recon.sh            |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    exit 1; fi

TARGET="$1"

echo -e "${GREEN}"
echo -e "Performing DNS recon using Google's 4.2.2.1 Internet Server"
echo -e "${NC}"
#Pleaes use a valid dns server in order to avoid dns fake.
dnsrecon -n 4.2.2.1 -d $TARGET > $TARGET.recon


#SOA, NS, A, AAAA, MX and SRV if AXRF on the NS servers fail.
echo -e "${GREEN}"
echo -e
echo -e "${NC}"
dnsrecon -d $TARGET -t std >> $TARGET.recon
dnsrecon -d $TARGET -t rvl >> $TARGET.recon
#Brute force domains and hosts using a given dictionary.
dnsrecon -d $TARGET -t brt -D /opt/SecLists/Discovery/DNS/subdomains-top1mil-5000.txt >> $TARGET.recon
#SRV records
dnsrecon -d $TARGET -t srv >> $TARGET.recon
#Test all NS servers for a zone transfer.
dnsrecon -d $TARGET -t axfr >> $TARGET.recon
#Perform Google search for subdomains and hosts.
dnsrecon -d $TARGET -t goo >> $TARGET.recon
#Remove the TLD of given domain and test against all TLDs registered in IANA.
dnsrecon -d $TARGET -t tld >> $TARGET.recon
#Perform a DNSSEC zone walk using NSEC records.
dnsrecon -d $TARGET -t zonewalk >> $TARGET.recon
#Search google, googleCSE, bing, bingapi, pgp, linkedin,google-profiles, jigsaw, twitter, googleplus, all
theharvester -d $TARGET -b all >> $TARGET.recon
#Perform a DNS reverse query on all ranges discovered
theharvester -d $TARGET -n >> $TARGET.recon
#Perform a DNS brute force for the domain name
theharvester -d $TARGET -c >> $TARGET.recon
#Perform a DNS TLD expansion discovery
theharvester -d $TARGET -t >> $TARGET.recon
##Specfic a dns server 
theharvester -d $TARGET -e 8.8.8.8 >> $TARGET.recon
#use SHODAN database to query discovered hosts
theharvester -d $TARGET -h >> $TARGET.recon


# Use domLink to discover additional hostnames
/opt/DomLink/domLink.py -C $TARGET >> $TARGET.recon


#Extract all raw hostnames discovered from the resulting file.
cat $TARGET.recon | grep $TARGET | grep -v [*] | grep -v @ > $TARGET.hostnames
cat $TARGET.recon | grep CNAME | awk {'print $3'} >> $TARGET.hostnames


#Extract all email addresses discovered in the resulting file.
cat $TARGET.recon | grep $TARGET | grep @ > $TARGET.emails


#Extract all DNS records discovered from the resulting file.
cat $TARGET.recon | grep TXT > $TARGET.records
cat $TARGET.recon | grep MX >> $TARGET.records
cat $TARGET.recon | grep SOA >> $TARGET.records
cat $TARGET.recon | grep PTR >> $TARGET.records
cat $TARGET.recon | grep SRV >> $TARGET.records






# Updating Shodan
# Configuring API Key
#easy_install -U shodan




