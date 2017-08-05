#!/bin/bash

# This script take an .txt file with a string on each line. Turns these values into an array, than prints the results 
# Version 1.1
# 03-08-2017
# Yaro Schiffelers

# don't forget: sudo chmod a+x txttoaray.sh

# BASIC STRUCTURE FULL PROGRAMM 
# import list allprograms.excel
# parse to arrayA, use regex to normalize (no caps, no whitespace, etc)
# use arrayA in for loop with brew cast search:
#			if arrayA{1} == {1}
# 				do parse to arrayDownload
#			elif arrayA{1} == multiple values 
#				do parse to arrayReview
#			else arrayA{1} -= {1}
#				do parse to arrayNotDownloadable 
# better compare listA to allprogrammsCask.txt via regex parse to new.txt than download


# SCRIPT

#put subsitute command here 
com="brew cask search" 

# remove old .txt files --> need to find a more elegant solution for this 
# need sudo for this or else it will ask you for permision for each rm command
# kinda shitty cause brew commands don't work with sudo 
# perhaps add online database, api, query this
# rm outputarayA.txt
# rm outputarayB.txt
# rm excellistlowerc.txt

# replace uppercase letters with lowercase letters 
tr '[:upper:]' '[:lower:]' < excellist.txt > excellistlowerc.txt

# turn each line of a .txt file into an array item 
IFS=$'\n' read -d '' -r -a arrayA < excellistlowerc.txt 

# https://stackoverflow.com/a/22432604/8398835
# get the lenght of the array 
arrayAlength=${#arrayA[@]}

# use a counter to itterate through each item of your array 
for (( i=1; i<${arrayAlength}+1; i++ ));

# do something for/with each item
do
	# print the value of $com and each array item, this creates a command/argument per line in the new file. We'll use this later.
	# send the output (via pipe | tee ) to a .txt file. 
	echo $com ${arrayA[$i-1]} | tee -a outputarayA.txt 
done

# get outputarrayA.txt and parse to arrayB same for loop as arrayA 
IFS=$'\n' read -d '' -r -a arrayB < outputarayA.txt
arrayBlength=${#arrayB[@]}
for (( i=1; i<${arrayBlength}+1; i++ ));
do
	${arrayB[$i-1]} >> match.txt
done
