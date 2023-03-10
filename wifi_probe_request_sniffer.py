print("+---_----------------------------------+")
print("|    Adversarial Informatics Combat    |")
print("|        Probe-Request Sniffer         |")
print("|         cygienesolutions.com         |")
print("| [Usage]: ./probe_request_sniffer.py  |")
print("+--------------------------------------+")

from datetime import datetime
from wifi import Cell
from scapy.all import *
iface = "wlan1mon"
iwconfig_cmd = "/usr/sbin/iwconfig"


# print ssid and source address of probe requests
def handle_packet(packet):
	if packet.haslayer(Dot11ProbeResp):
		print(str(datetime.now()) + " " + str(packet[Dot11].addr2) + " searches for " + str(packet.info))

# set device into monitor mode
os.system("airmon-ng start wlan1")

# start sniffin them packets
print("Sniffing on interface: " + iface)
sniff(iface=iface, prn=handle_packet)