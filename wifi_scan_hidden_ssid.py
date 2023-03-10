print("+---_----------------------------------+")
print("|    Adversarial Informatics Combat    |")
print("|          hidden SSID scanner         |")
print("|         cygienesolutions.com         |")
print("| [Usage]: ./wifi_scan_hidden_ssid.py  |")
print("+--------------------------------------+")

from datetime import datetime
from wifi import Cell
from scapy.all import *
iface = "wlan1mon"
iwconfig_cmd = "/usr/sbin/iwconfig"

def handle_packet(packet):
	if packet.haslayer(Dot11ProbeReq) or packet.haslayer(Dot11ProbeResp) or packet.haslayer(Dot11AssoReq):
		print("Found SSID:", packet.info)
		

# bounce interface into monitor mode
os.system("airmon-ng stop wlan1mon")
os.system("airmon-ng start wlan1")

# start sniffing
print("Sniffing on iterface: ", iface)
sniff(iface=iface, prn=handle_packet)



