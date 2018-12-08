import webbrowser
import urllib
from sets import Set
import sys


try:
	websrv_list  = sys.argv[1]
except:
	print "[+] Usage: view_web_srv_aic.py <path_to_file>"
	sys.exit(1)

def remove_dupes(jaja):
	uniqueList = Set(jaja)
	return uniqueList

def cp_collect(): #copy and paste a list of items and it will kick it out as a unique list
	master = []
	while 1:
		host = raw_input("Item: ")
		if host == "done":
			unique_master = remove_dupes(master)
			return unique_master
		master.append(host)
	unique_master = remove_dupes(master)
	return unique_master


# Create an HTTP Servers HTML report
def httpServers(jaja):
	file = open("HTTPservers.htm", "w")
	#create the header file
	opener = "<html><head></head><body>"
	file.write(opener)
	file.write("<h3> HTTP web servers </h3>")
	#feed in the web server list
	for line in jaja:
		url = "http://" + line[:-1] + "</a>\n"
		link = "<a href=\"http://" + line[:-1] + "\">" + url + "</a>"
		file.write(link + "</br>")
	#close the html file
	closer = "</body></html>"
	print "Writing HTTP File: HTTPservers.htm..."
	file.write(closer)
	file.close()
	print "Done."
	#webbrowser.open("HTTPservers.htm")

# Create an HTTPS Servers HTML report
def httpsServers(jaja):
	file = open("HTTPSservers.htm", "w")
	#create the header file
	opener = "<html><head></head><body>"
	file.write(opener)
	file.write("<h3> HTTP web servers </h3>")
	#feed in the web server list
	for line in jaja:
		url = "https://" + line[:-1] + "</a>\n"
		link = "<a href=\"https://" + line[:-1] + "\">" + url + "</a>"
		file.write(link + "</br>")
	#close the html file
	closer = "</body></html>"
        print "Writing HTTP File: HTTPSservers.htm..."
	file.write(closer)
	file.close()
	print "Done."
	#webbrowser.open("HTTPSservers.htm")


if __name__=='__main__':
	jaja = []
	with open(websrv_list, 'r') as web_file:
		for line in web_file:
			jaja.append(line)
	httpServers(jaja)
	httpsServers(jaja)
	print "Opening HTTP and HTTPS files..."
	webbrowser.open("HTTPservers.htm")
	webbrowser.open("HTTPSservers.htm")

