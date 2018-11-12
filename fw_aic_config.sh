#! /bin/sh

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[49;93m'
NC='\033[0m' # No Color

echo -e "${YELLOW}"
echo -e "+---_-----------------------------------------------+"
echo -e "|  Adversarial Informatics nix iptables std config  |"
echo -e "|             cygienesolutions.com                  |"
echo -e "|          [Usage]: ./fw_aic_config.sh              |"
echo -e "+---------------------------------------------------+"
echo -e "${NC}"
#if [ $# == 0 ] ; then
#    exit 1; fi

### BEGIN INIT INFO
### END INIT INFO

iptables -F

# Configure Defaults
echo -e "${GREEN}"
echo -e "Configuring default policy: No INPUT|FORWARD, All OUTPUT..."
echo -e "${NC}"
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
echo "Ok."

#Rules for PSAD
echo -e "${GREEN}"
echo -e "Activating Logging Activity..."
echo -e "${NC}"
iptables -A INPUT -j LOG
iptables -A FORWARD -j LOG
echo "Ok."

# INPUT
echo -e "${GREEN}"
echo -e "Enabling Loopback traffic..."
echo -e "${NC}"
iptables -A INPUT -i lo -p all -j ACCEPT
echo "Ok."

echo -e "${GREEN}"
echo -e "Allowing 3Way Handshakes..."
echo -e "${NC}"
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
echo "Ok."


# Stop Masked Attackes
echo -e "${GREEN}"
echo -e "Dropping Maked Attacks i.e. strange ICMP attacks..."
echo -e "${NC}"
iptables -A INPUT -p icmp --icmp-type 13 -j DROP
iptables -A INPUT -p icmp --icmp-type 17 -j DROP
iptables -A INPUT -p icmp --icmp-type 14 -j DROP
iptables -A INPUT -p icmp -m limit --limit 1/second -j ACCEPT
echo "Ok."

# Discard invalid Packets
echo -e "${GREEN}"
echo -e "Dropping invalid packets..."
echo -e "${NC}"
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
echo -e "Done."

### Drop Spoofing attacks
echo -e "${GREEN}"
echo -e "Dropping all spoofing attacks..."
echo -e "${NC}"
iptables -A INPUT -s 10.0.0.0/8 -j DROP
iptables -A INPUT -s 169.254.0.0/16 -j DROP
iptables -A INPUT -s 172.16.0.0/12 -j DROP
iptables -A INPUT -s 127.0.0.0/8 -j DROP
iptables -A INPUT -s 192.168.0.0/24 -j DROP
iptables -A INPUT -s 224.0.0.0/4 -j DROP
iptables -A INPUT -d 224.0.0.0/4 -j DROP
iptables -A INPUT -s 240.0.0.0/5 -j DROP
iptables -A INPUT -d 240.0.0.0/5 -j DROP
iptables -A INPUT -s 0.0.0.0/8 -j DROP
iptables -A INPUT -d 0.0.0.0/8 -j DROP
iptables -A INPUT -d 239.255.255.0/24 -j DROP
iptables -A INPUT -d 255.255.255.255 -j DROP
echo "Ok."


echo -e "${GREEN}"
echo -e "Drop packets with excessive RST to avoid Masked attacks"
echo -e "${NC}"
iptables -A INPUT -p tcp -m tcp --tcp-flags RST RST -m limit --limit 2/second --limit-burst 2 -j ACCEPT
echo "Ok."


echo -e "${GREEN}"
echo -e "Any IP that performs a PortScan will be blocked for 24 hours"
echo -e "${NC}"
iptables -A INPUT   -m recent --name portscan --rcheck --seconds 86400 -j DROP
iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 -j DROP
echo "Ok."


# 
echo -e "${GREEN}"
echo -e "After 24 hours remove IP from block list"
echo -e "${NC}"
iptables -A INPUT   -m recent --name portscan --remove
iptables -A FORWARD -m recent --name portscan --remove
echo "Ok."
# 
echo -e "${GREEN}"
echo -e "Ensuring all portscan attempts are logged..."
iptables -A INPUT   -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "Portscan:"
iptables -A INPUT   -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "Portscan:"
iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
echo "Ok."

# Inbound Ruleset
echo -e "${GREEN}"
echo -e "Allowing Inbound SMTP|HTTP|HTTPS|SSH|SFTP"
echo -e "${NC}"
# smtp
iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
# http
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
# https
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
# ssh & sftp
iptables -A INPUT -p tcp -m tcp --dport 372 -j ACCEPT
echo "Ok."

echo -e "${GREEN}"
echo -e "Allowing Inbound ICMP"
echo -e "${NC}"
iptables -A INPUT -p icmp --icmp-type 0 -j ACCEPT
echo "Ok."

echo -e "${GREEN}"
echo -e "Limit SSH connection from a single IP"
echo -e "${NC}"
iptables -A INPUT -p tcp --syn --dport 372 -m connlimit --connlimit-above 2 -j REJECT
echo "Ok."

echo -e "${WHITE}"
iptables -L
echo -e "${NC}"


