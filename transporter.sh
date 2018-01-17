#!/bin/bash

# Checks if the programs listed in mylist.txt are downloadable via brew cask. 
# Downloads the programs that can be downloaded. 
# Need to complete readme.md
# Version 1.2
# 08-08-2017
# Yaro Schiffelers
# github.com/yaroschiffelers

# SCRIPT

# Get current list of downloadable programs via brew cask
echo "Getting current list of all programs Cask can download"
brew cask search >| fullcasklist.txt

# Import mylist.txt to mylistlowercase(array) with only lowercase letters 
# This function is redundant, $brew cask works just as well with uppercase (or combined) input
# Ill just leave it here for later use: 
# testing in transid.sh --> need to make executable chmod joe
# REMOVE AFTER TESTING IS DONE 
echo "Converting mylist.txt"
mylistlowercase=($(tr '[:upper:]' '[:lower:]' < mylist.txt))

# Compare $mylistlowercase[] to fullcasklist.txt Output the results to matches.txt
echo "Comparing"
grep -x ${mylistlowercase[@]/#/-e } fullcasklist.txt >| matches.txt
IFS=$'\n' read -d '' -r -a matches < matches.txt

# Show the user the programs cask can download for them 
echo "######################"
echo "Programms to download:"
matcheslength=${#matches[@]}
for (( i=1; i<"${matcheslength}"+1; i++ ));
do
 	echo -e "${matches[$i-1]}"
done

# Ask user whether or not they want to download these programs 
echo "######################"
echo -n -e "Do you want to download these programms (y/n)?\n"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
	# Download the programs in $matches[] via brew cast install
	if echo "$answer" | grep -iq "^y" ;then
		for (( i=1; i<"${matcheslength}"+1; i++ ));
		do 
			brew cask install "${matches[$i-1]}"
		done
	else 
		echo "Exit"
		exit 
	fi
echo "Done"
exit