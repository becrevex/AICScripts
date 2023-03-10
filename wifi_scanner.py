print("+---_----------------------------------------------+")
print("|    Adversarial Informatics Combat Wifi Scanner   |")
print("|               cygienesolutions.com               |")
print("|              [Usage]: ./wifi_scanner             |")
print("+--------------------------------------------------+")

from wifi import Cell

iface = "wlan1"

ap_dict = {}

for cell in Cell.all(iface):
	output = "%s\t(%s)\tchannel %d\tsignal %d\tmode %s  " % (cell.ssid, cell.address, cell.channel, cell.signal, cell.mode)
	ap_dict[cell.ssid] = [cell.address, cell.channel, cell.signal, cell.mode]
	if cell.encrypted:
		output += "(%s) " % (cell.encryption_type.upper(), )
		ap_dict[cell.ssid].append(cell.encryption_type.upper())
	else:
		output += "(Open)"
		ap_dict[cell.ssid].append("Open")
		
	print(output)

