print("+---_----------------------------------------------+")
print("|    Adversarial Informatics Wifi Attack Module    |")
print("|               cygienesolutions.com               |")
print("|            [Filename]: ./wifi_atk.py             |")
print("+--------------------------------------------------+")

from wifi import Cell
import pprint

iface = "wlan1"

class WIFI:
	ap_dict = {}

	def __init__(self):
		print("Wifi Enumeration and Attack Framework")


	def view_live_aps(self):
		for cell in Cell.all(iface):
			output = "%s\t(%s)\tchannel %d\tsignal %d\tmode %s  " % (cell.ssid, cell.address, cell.channel, cell.signal, cell.mode)
			self.ap_dict[cell.ssid] = [cell.address, cell.channel, cell.signal, cell.mode]
			if cell.encrypted:
				output += "(%s) " % (cell.encryption_type.upper(), )
				self.ap_dict[cell.ssid].append(cell.encryption_type.upper())
			else:
				output += "(Open)"
				self.ap_dict[cell.ssid].append("Open")
				
			#print(output)
		pprint.pprint(self.ap_dict)
