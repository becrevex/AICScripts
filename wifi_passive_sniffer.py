print("+---_----------------------------------------------+")
print("|    Adversarial Informatics Combat Wifi Sniffer   |")
print("|               cygienesolutions.com               |")
print("|              [Usage]: ./wifi_scanner             |")
print("+--------------------------------------------------+")

from wifi import Cell
from scapy.all import *
iface = "wlan1mon"
iwconfig_cmd = "/usr/sbin/iwconfig"

# set interface to monitor mode

#os.system(iwconfig_cmd + " " + iface + " mode monitor")
os.system("airmon-ng start wlan1")

def dump_packet(pkt):
	if not pkt.haslayer(Dot11Beacon) and \
		not pkt.haslayer(Dot11ProbeReq) and \
		not pkt.haslayer(Dot11ProbeResp):
			print(pkt.summary())
			
			if pkt.haslayer(Raw):
				print(hexdump(pkt.load))
			print("\n")
			

while True:
	for channel in range(1, 14):
		os.system(iwconfig_cmd + " " + iface + \
				" channel " + str(channel))
		print("Sniffing on channel " + str(channel))
		
		sniff(iface= iface,
				prn= dump_packet,
				count=10,
				timeout=3,
				store=0)