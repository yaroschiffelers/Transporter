#!/bin/bash

# This script take an .txt file with a string on each line. Turns these values into an array, than prints the results 
# Version 1.1
# 03-08-2017
# Yaro Schiffelers

# don't forget: sudo chmod a+x txttoaray.sh
# or chmod 755 
# sudo ./name.sh

# WORKING VERSION 

#put subsitute command here 
com="brew" 

# turn each line of a .txt file into an array item 
IFS=$'\n' read -d '' -r -a array < allprogscaskcandownload.txt 

# https://stackoverflow.com/a/22432604/8398835
# get the lenght of the array 
arraylength=${#array[@]}

# use a counter to itterate through each item of your array 
for (( i=1; i<${arraylength}+1; i++ ));

# do something for/with each item
do
	# print the value of $com and each array item, 
	# send the output (via pipe | tee ) to a .txt file. 
	# -a shows us the results of this loop while it is running.
  echo $com ${array[$i-1]} | tee -a outputaray1.txt
done

# DONT USE THIS IT FUCKS THINGS UP 
# newarray=$com ${array[$i-1]} 
# $newarray > outputnewaray.txt 


# Other Options 
# 1
# Based on: https://stackoverflow.com/a/11393884/8398835
# IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat allprogscaskcandownload.txt))'
# printf "%s\n" "${XYZ[1]}"
# # echo $com "${XYZ[1]}" prints only item 1 of aray $XYZ
# sync:x:5:0:sync:/sbin:/bin/sync

# # 2
# IFS=$'\n' read -d '' -r -a lines < allprogscaskcandownload.txt
# printf "%s\n" "$com ${lines[4]}" #line x in aray lines (4 = 5th item, count form 0: 0=1, 1=2, 2=3, 3=4, 4=5)
# echo "${lines[@]}" #all lines, not seperated
# printf '%s\n' "${lines[@]}"

# # 3 
# IFS=$'\n' read -d '' -r -a array < allprogscaskcandownload.txt
# arraylength=${#array[@]}
# for i in "${array[@]}"
# do 
# 	echo "$com" "$i"
# done