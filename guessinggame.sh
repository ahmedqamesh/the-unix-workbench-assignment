#!/usr/bin/env bash
# File: guessinggame.sh  Author: Ahmed Qamesh
# Aim: Guess the number of files in a directory



Files=$(ls | wc -l)
guessed=1
pattaren="^[0-9]*$"
max=100  #default value if input parameter is invalid
if [[ $1 =~ $pattaren ]] && [[ $1 -gt Files ]]
then
	max=$1
fi
echo "Write the number of files you guess in the $PWD directory. Enter an integer between 0 and $max"
while [[ $guess -ne $Files ]]
do 
	printf "Please enter you guess #$guessed: "
    read -r guess
    if ([[ $guess =~ $pattaren ]] && [[ $guess -le $max ]] && [[ $guess -gt 0 ]])
    then
    if [[ $guess -lt Files ]]
 	then
		echo -e "The guess of $guess is = low\n"
		let guessed=$guessed+1
	elif [[ $guess -gt Files ]]
	then
		echo -e "The guess of $guess is high\n"
		let guessed=$guessed+1
	fi
    else 
        echo "$guess is an invalid value.  Please enter an integer between 0 and $max"
    fi
done

if [[ guessed -eq 1 ]] 
then
    echo -e "\n The guess is right!!\n"
else   
    echo -e "\n Correct guess after  $guessed tries!!!\n"
fi
