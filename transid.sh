#!/bin/bash

# Finetune transporter.sh testing 
# useing pre definded list als input for $mylistlowwercase 
mylistlowercase=($( '' '' < fullcasklistshort.txt))

# testing output/input conversion 
matcheslength=${#mylistlowercase[@]}
for (( i=1; i<"${matcheslength}"+1; i++ ));
do
    echo -e "${mylistlowercase[$i-1]}"
done