#!/usr/bin/python

# NOTES
	# Remove the number part of the tweet file filename before running this script
	# If desired, you can manually remove all words with less than a particular word count from the frequency.txt file

files = []
files.append(str("tweets.txt"))

words_to_ignore = []
things_to_strip = [".",",","?",")","(","\"",":",";","'s"]
words_min_size = 0

text = ""
for file in files:
	f = open(file,"rU")
	for line in f:
		text += line
 
words = text.lower().split()
wordcount = {}
for word in words:
	for thing in things_to_strip:
		if thing in word:
			word = word.replace(thing,"")
	if word not in words_to_ignore and len(word) >= words_min_size:
		if word in wordcount:
			wordcount[word] += 1
		else:
			wordcount[word] = 1
		
sortedbyfrequency =  sorted(wordcount,key=wordcount.get,reverse=True)
 
def print_txt(sortedbyfrequency):
	outputfile = open("frequency.txt", "w")
	for word in sortedbyfrequency:
		outputfile.write(word + ":" + str(wordcount[word]) + " ")
		
print_txt(sortedbyfrequency)