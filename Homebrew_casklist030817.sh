#!/bin/sh

# Bash script for installing programms via Homebrew and Homebrew Cask
# Version 1.0 
# 03-08-2017
# Yaro Schiffelers

# Notes: 
# Terminal commands are between **$ ** 
# Prerequisites: Homebrew and Homebrew Cask installed 
# Check if Caskroom is set to /User/Applications (if not, run: **$ brew cask --caskroom=/Applications**)
# Before running this script you need to make it executable. To do this cd to the dir this file is in, than enter: **$ chmod a+x FILENAME.sh**
# After chmod a+x you are able to run the script. cd to file dir, than: **$ ./FILENAME.sh**

# Homebrew Cask uses specific names for apps that aren't always intuitive. t
# If you want to edit this list, please use: **$ brew cask search app name** to search for an app, and use the propper name given by Homebrew Cask
# After edditing save as .sh and give it a different name (including date).

# TODO:
# - Check if these programms are free, if not, don't include, just download them via torrent 
# - Check EveryMacDotApp.txt for essential programms, add them to the list 

# START OF LIST
# Last edit: 03-08-2017

# Browsers
brew cask install chrome 
- opera
- firefox
- firefox developer edition 


# Producivity
- nylas
- superduper! 

# Terminal add-ons 
- mac
- m 
- macly
- python 
- php
- npm
- node.js
- 

# Programming
- Xcode
- Textwrangler 
- Scripteditor
- Github desktop 
- Canopy 
- controllermate 
- arduino
- mamp 
- idle 
- brackets 
- r64
- phyton launcher 
- x quartz 

# Network tools
- wireshark
- zenmap
- filezilla
- server 

# Design 
- sketchup 
- adobe cc 
- max
- maxruntime
- quartz composer

# Music
- spotify 
- recordbox 
- logic pro x 
- traktor 2 
- mixed in key 

# Other
- flux
- hackernews 
- little snitch 
- daisy disk 
- skype 
- vuze 
- limechat 
- keka 
- app zapper
- slack 
- gpg keychain 
- disk drill 
- mega sync
- scrivener 
- money pro
- omnifocus
- dr.phone toolkit for ios
#END OF LIST