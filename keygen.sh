#

# Author: Yannis STEFANELLI

# Creation Date: 21-11-2022 15:50:26

# Description :

#

#!/bin/bash

# We use variables so we don't have to rewrite those words multiple times
opt1="RSA"
opt2="DSA"
opt3="ECDSA"
opt4="ed25519"

type=""
bits=""
newformat=""

# creating a menu with the following options
echo -e "\n-- Welcome to the Custom SSH key Generator --\n\nPlease choose the type of key you want to generate:\n";
echo -e "1. $opt1\t\t2. $opt2"
echo -e "3. $opt3\t4. $opt4"
echo -e "\n0. Exit without saving"
echo -ne "\nEnter choice [0-4]: "

# reading choice
read choice

# case statement is used to compare one value with the multiple cases.
case $choice in
  0)  echo "Quitting ..."
      exit;;
  # Pattern 1
  1)  echo -e "\nYou have selected $opt1"
        type="$opt1"
      break;;
  # Pattern 2
  2)  echo -e "\nYou have selected $opt2"
      type="$opt2"
      break;;
  # Pattern 3
  3)  echo -e "\nYou have selected $opt3"
      type="$opt3"
      break;;   
  # Pattern 4
  4)  echo -e "\nYou have selected $opt4"
      type="$opt4"
      break;; 
  # Default Pattern
  *)  echo "invalid option, using RSA as default.."
      type="$opt1" 
      break;;
esac

#Bits part
echo -e "\nChange bit length ? Y/N\t(advanced users only)"

if [ $type = $opt1 ];
then
    bits="3072"
fi
if [ $type = $opt3 ];
then
    bits="256"
fi 

choice=""
read choice

if [[ $choice = "Y" ]] || [[ $choice = "y" ]];
  then
    echo -n "Length : "
    read bits
fi

echo -e "\nUse new format ? Y/N\t(advanced users only)"
if [[ $choice = "Y" ]] || [[ $choice = "y" ]];
  then
    newformat="-o"
fi
read pause
ssh-keygen -t $type -b $bits $newformat
