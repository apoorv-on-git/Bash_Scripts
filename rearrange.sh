#!/bin/bash

#making Directories
mkdir Text\ File/
mkdir Pictures
mkdir Videos

#For loop to iterate over files
for file in *
do

	#Storing the output of this command using '$' in a variable 'a'
	a=$(file -i $file)

	#if - elif - else conditions
	if [[ $a == *"text"*  ]]
	then
		mv $file ./Text\ File/
	
	elif [[ $a == *"image"* ]]
	then
		mv $file ./Pictures/
	
	elif [[ $a == *"video"* ]]
	then
		mv $file ./Videos/

	#Using ':' to tell the program to do nothing
	else
		:
	fi
done
