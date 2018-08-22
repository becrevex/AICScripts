import string
import os
from termcolor import colored


def lsPrint(txt):
#yellow		Windows/AD Related / requires research(1)
#green		known vulnerabilities associated with finding, outdated software(2)
#cyan		Things to check out right now (3)
#magenta	Administrative, discovered vuln, backdoor, instant access (5)
	score = 0
        if '2000' in txt:
                print colored( txt, 'green'),
		score += 2
	elif '2003' in txt:
		print colored( txt, 'yellow'),
		score += 1
        elif 'ftpd' in txt:
                print colored( txt, 'green'),
		score += 2
	elif 'vsftpd' in txt:
		print colored( txt, 'green'),
		score += 2
	elif 'telnet' in txt:
		print colored( txt, 'green'),
		score += 2
	elif 'unauthorized' in txt:
		print colored( txt, 'yellow'),
		score += 1
	elif "Upload" in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'upload' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'writable' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'workgroup' in txt:
		print colored( txt, 'yellow'),
		score += 1
	elif 'Samba' in txt:
		print colored( txt, 'yellow'),
		score += 1
	elif 'admin' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'Admin' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'Administrator' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'VULNERABLE' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'vulnerable' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'true' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'CVE-' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'folder' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'directory' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif '\\..\\..\\' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'Interesting' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif '<DIR>' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'Anonymous' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'listing' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'robots.txt' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'default' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'SSH' in txt:
		print colored( txt, 'yellow'),
		score += 1
	elif 'LISTABLE' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif '(CODE:403|:' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif '(CODE:200|' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'writeable' in txt:
		print colored( txt, 'magenta'),
		score += 5
	elif 'NetBIOS computer name:' in txt:
		print colored( txt, 'green'),
	elif 'found' in txt:
		print colored( txt, 'cyan'),
		score += 3
	elif 'Acritum' in txt:
		print colored(txt, 'red'),
	elif 'JSP engine 1.1' in txt:
		print colored(txt, 'red'),
	elif 'httpd 1.3.23' in txt:
		print colored(txt, 'red'),
	elif 'mod_ssl|2.8.7' in txt:
		print colored(txt, 'red'),
	elif 'PHP|5.2.6-3ubuntu4.4' in txt:
		print colored(txt, 'red'),
	elif 'DAV|2 mod_ssl|2.2.14' in txt:
		print colored(txt, 'red'),
	elif 'PHP|5.3.1' in txt:
		print colored(txt, 'red'),
	elif 'Asterisk Call Manager 1.1' in txt:
		print colored(txt, 'red'),
	elif 'CUPS 1.1' in txt:
		print colored(txt, 'red'),
	elif 'CoreHTTP httpd 0.5.3.1' in txt:
		print colored(txt, 'red'),
	elif 'Dovecot imapd' in txt:
		print colored(txt, 'red'),
	elif 'FileZilla ftpd 0.9.34 beta' in txt:
		print colored(txt, 'red'),
	elif 'GoAhead WebServer' in txt:
		print colored(txt, 'red'),
	elif 'GuildFTPd' in txt:
		print colored(txt, 'red'),
	elif 'James Remote Admin 2.3.2' in txt:
		print colored(txt, 'red'),
	elif 'Java RMI' in txt:
		print colored(txt, 'red'),
	elif 'Linux SNMP multiplexer' in txt:
		print colored(txt, 'red'),
	elif 'MariaDB' in txt:
		print colored(txt, 'red'),
	elif 'DNS 6.0.6001' in txt:
		print colored(txt, 'red'),
	elif 'Microsoft Distributed Transaction' in txt:
		print colored(txt, 'red'),
	elif 'ESMTP 5.0.2195.5329' in txt:
		print colored(txt, 'red'),
	elif 'Microsoft DNS 6.1.7601' in txt:
		print colored(txt, 'red'),
	elif 'httpd 2.0 (SSDP|UPnP)' in txt:
		print colored(txt, 'red'),
	elif 'IIS httpd 5.0' in txt:
		print colored(txt, 'red'),
	elif 'IIS httpd 5.1' in txt:
		print colored(txt, 'red'),
	elif 'IIS httpd 6.0' in txt:
		print colored(txt, 'red'),
	elif 'SQL Server 2000' in txt:
		print colored(txt, 'red'),
	elif 'Microsoft Terminal Service' in txt:
		print colored(txt, 'red'),
	elif 'Microsoft Windows 2000 microsoft-ds' in txt:
		print colored(txt, 'red'),
	elif 'MiniServ 0.01' in txt:
		print colored(txt, 'red'),
	elif 'OpenSSH 3.1p1' in txt:
		print colored(txt, 'red'),
	elif 'XML DB ftpd 9.2.0.1.0' in txt:
		print colored(txt, 'red'),
	elif 'Oracle TNS Listener 9.2.0.1.0' in txt:
		print colored(txt, 'red'),
	elif 'ProFTPD 1.3.3a' in txt:
		print colored(txt, 'red'),
	elif 'RealVNC 4.0' in txt:
		print colored(txt, 'red'),
	elif 'Python 2.6.5' in txt:
		print colored(txt, 'red'),
	elif 'Samba smbd 3.X - 4.X' in txt:
		print colored(txt, 'red'),
	elif 'Squid http proxy 3.3.8' in txt:
		print colored(txt, 'red'),
	elif 'SunSSH 1.1.5' in txt:
		print colored(txt, 'red'),
	elif 'TightVNC' in txt:
		print colored(txt, 'red'),
	elif 'UW Imap pop3d 2001.78rh' in txt:
		print colored(txt, 'red'),
	elif 'hMailServer' in txt:
		print colored(txt, 'red'),
	elif 'nginx 1.6.3' in txt:
		print colored(txt, 'red'),
	elif 'vsftpd 1.1.3' in txt:
		print colored(txt, 'red'),
	elif 'vsftpd 2.0.1' in txt:
		print colored(txt, 'red'),
	elif "smb-vuln-ms" in txt:
		print colored(txt, 'yellow')
	elif "|_" in txt:
		print colored(txt, 'yellow')
	else:
                print txt,
	return score



def consolidate_xml():
	print "Consolidating XML from all directories..."
	cmd = "find . -name '*.aic.xml' -exec cat {} + > xml_scan_data.xml"
	os.system(cmd)
	print "Done.  Filename: xml_scan_data.xml"
	print "Import into MSF with:"
	print "msf> db_import /path/xml_scan_data.xml"


if __name__ == '__main__':
	cmd = "find . -name '*.nmap' -exec cat {} + > scan_data.txt"
	os.system(cmd)
	file = open('scan_data.txt')
	for line in file:
		lsPrint(line)
	file.close()
	consolidate_xml()

