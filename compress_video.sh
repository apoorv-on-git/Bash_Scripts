#!/bin/bash

#To install ffmpeg
sudo apt-get install synaptic
sudo apt-get update
sudo apt-get install ffmpeg

#To install sox
sudo apt-get install sox

echo Enter the Filename/path - 

read filename

#Extracting Audio from file
ffmpeg -i $filename -q:a 0 -map a audio.wav &&

#Extracting Video from file
ffmpeg -i $filename -c copy -an video.mp4 &&

#Creating Noise Profile
sox audio.wav -n noiseprof noise.prof &&

#Creating a new audio with no noise distortions
sox audio.wav audio-clean.wav noisered noise.prof 0.21 &&

#Removing the distorted audio
rm audio.wav &&

#Removing the noise profile
rm noise.prof &&

#Combining new audio with video
ffmpeg -i video.mp4 -i audio-clean.wav -strict -2 new_video.mp4 &&

#Removing the video and audio
rm video.mp4 &&
rm audio-clean.wav &&

echo Enter a name for the new video -

read new_name

#Reducing the size of the video
ffmpeg -i new_video.mp4 -b 300000 -strict -2 $new_name.mp4 &&

#Removing the output
rm new_video.mp4
