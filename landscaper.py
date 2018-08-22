# Programmer: q0m
# Date: 5/24/2017
# Description: Class for reading discovery files and tracking systems

import os
import string
import random
from termcolor import colored
from sets import Set


def remove_dupes(jaja):
        rd = []
        uniqueList = Set(jaja)
        for i in uniqueList:
                rd.append(i)
        return rd

def cp_collect():
        master =[]
        while 1:
                host = raw_input("Item: ")
                if host == "done":
                        unique_master = remove_dupes(master)
                        return unique_master
                master.append(host)
        unique_master = remove_dupes(master)
        return unique_master

def targetbox(ip):
        atk_pro = []
        curdir = os.listdir(".")
        PWNED = ''
        # Get the attack profile files
        for filename in curdir:
                if ip in filename:
                        try:
                                atk_pro.append(string.split(filename, "_")[1])
                        except:
                                pass
        atk_p = remove_dupes(atk_pro)

        if 'postex' in atk_p:
                PWNED = 'x'
                box1 = colored("     _____    ", 'red')
                box2 = colored("    |\ /| |  ", 'red') + "IP:           %s   " % (ip)
                box3 = colored("    |/_\| |  ", 'red') + "Ports:        %s   " % ('')
                box4 = colored("    |     |  ", 'red') + "ProFiles:     %s   " % (','.join(atk_p))
                box5 = colored("    |_____|  ", 'red') + "PWNED:        [%s]  " % (PWNED)
        else:
                box1 = colored("     _____    ", 'green')
                box2 = colored("    |   | |  ", 'green') + "IP:         %s   " % (ip)
                box3 = colored("    |___| |  ", 'green') + "Ports:      %s   " % ('')
                box4 = colored("    |     |  ", 'green') + "ProFiles:   %s   " % (','.join(atk_p))
                box5 = colored("    |_____|  ", 'green') + "PWNED:      [%s]  " % (PWNED)

        boxl = "\n    [+] Attack Surface:   %s   " % ("")
        box = [box1,box2,box3,box4,box5,boxl]
        for i in box:
                print i


class Targets:
	Lookup = {}

	def __init__(self):
		self.populate_scan_data()

	def populate_scan_data(self):
		f_details = []
		os.system("find . -name '*.gnmap' -exec cat {} + > scan_grep_data.txt")
                full_details = open("scan_grep_data.txt")
                for item in full_details:
                        ip = string.split(item)[0]
                        services = string.split(item, "/,")
                        vuln1 = string.split(services[0])[1:]
                        vulns = services[1:]
                        vulns.append(' ' + ' '.join(vuln1))
                        self.Lookup[ip] = [vulns]
