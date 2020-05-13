# AIC Scripts Collection
Operational Security Automation Scripts for a Standard Kali Build

# Installation
Take care of the dependencies:<br>
$ git clone https://github.com/becrevex/AICScripts.git

# Current Script Descriptions


Kampai: Custom Kenna Connector for single or bulk import.<br>
<br>
EXAMPLE: kampai.py -id CVE-1999-5656 -ip 10.21.21.21 -p 8080 -s 5 -fix "Upgrade to the latest version"<br>
<br>
<br>
# Create XLS Template File (for population)<br>
c:\\>python kampai.py -createxls<br>
Kampai Template File kampai_xls_template.xls created.<br>
<br>
<br>
# Bulk Import XLS Template File 
C:\\>python kampai.py -iX kampai_reporter.xls<br>
Resource file loaded.<br>
Record count:  2<br>
Record #1<br>
********************<br>
Vuln ID:     CVE-2019-3568<br>
IP Address:  10.21.21.21<br>
Port:        80<br>
Details:     Update WhatsApp on your Android.<br>
Severity:    9<br>
<br>
Record #2<br>
********************<br>
Vuln ID:     CVE-2018-0001<br>
IP Address:  10.21.21.22<br>
Port:        79<br>
Details:     Update Junos OS to the latest version.<br>
Severity:    9<br>
 <br>
Import all records into Kenna? Y/n y<br>
https://api.kennasecurity.com/vulnerabilities/3438279593<br>
https://api.kennasecurity.com/vulnerabilities/3439111138<br>
Record count:  2<br>
Generated Kampai Report File:  2019-06-11_10-11-33_kampai_report.xls created.<br>
