#!/usr/bin/python

# NOTES
	# This script will count the number of tweets within an output.txt file

import re

output = open("output.txt", "r");

regex = re.compile("\n\n");

newlinenewline = regex.findall(output.read());

print len(newlinenewline);