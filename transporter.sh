#!/bin/bash

# Checks if the programs listed in mylist.txt are downloadable via brew cask. Downloads them if true. 
# And some other stuff, need to complete readme.md. 
# Version 1.1
# 06-08-2017
# Yaro Schiffelers
# github.com/yaroschiffelers

# SCRIPT

# Update Homebrew and Brewcask to latest version 
echo "Updating Homebrew"
brew update 
echo "Updating Brewcask"


# Get current list of downloadable programs via brew cask
brew cask search >| fullcasklist.txt

# Convert mylist.txt to mylist with only lowercase letters 
tr '[:upper:]' '[:lower:]' < mylist.txt >| mylistlowercase.txt

# Import mylistlowercase.txt to arrayA 
IFS=$'\n' read -d '' -r -a arrayA < mylistlowercase.txt

# Compare mylistlowercase.txt to fullcasklist.txt Output the results to matches.txt
grep -x ${arrayA[@]/#/-e } fullcasklist.txt >| matches.txt

echo "######################"
echo "Programms to download:"

# Import matches.txt to arrayB
IFS=$'\n' read -d '' -r -a arrayB < matches.txt

arrayBlength=${#arrayB[@]}

# Show user the programs cask can download for them 
for (( i=1; i<${arrayBlength}+1; i++ ));
do
 	echo ${arrayB[$i-1]}
done

# Ask user whether or not they want to download these programs 
echo "################################"
echo -n -e "Do you want to download these programms (y/n)?\n"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg  

	if echo "$answer" | grep -iq "^y" ;then
		for (( i=1; i<${arrayBlength}+1; i++ ));
		do 
			brew cask install ${arrayB[$i-1]}
			echo "Exit"
		done

	else 
		echo "Exit"

	fi