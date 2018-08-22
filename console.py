import string, os
from sets import Set
import sys


def remove_dupes(jaja):
	uniqueList = Set(jaja)
	return uniqueList


def cp_collect():
	master = []
	while 1:
		host = raw_input("  > ")
		if host == "done":
			unique_master = remove_dupes(master)
			return unique_master
		master.append(host)
	unique_master = remove_dupes(master)
	return unique_master


if len(sys.argv) > 1:
	targets = []
	file = open(sys.argv[1])
	for target in file:
		targets.append(target)
else:
	print "Enter the hosts..."
	targets = cp_collect()

os.system("ls -l *.sh")
enum_script = raw_input("What script: ")
port = raw_input("Port number: ")
for item in targets:
	os.system(enum_script + " " + item + " " + port)
