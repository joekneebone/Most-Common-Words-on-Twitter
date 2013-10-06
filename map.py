#!/usr/bin/python
import re

# NOTES
	# This script removes duplicate tweets, and outputs the tweets to a new text file

originalfile = open("output.txt", "r")
regex = re.compile(".+")

tweets = regex.findall(originalfile.read());

newtweets = set(tweets)

originalfile.close
outputfile = open(str(len(newtweets)) + "tweets.txt", "w")

for tweet in newtweets:
	outputfile.write(tweet + " ")
