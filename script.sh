#!/bin/bash

echo $'\n'
echo '===Step 1 of 3: Asking for Storage Permission==='

sleep 2;
termux-setup-storage
sleep 2;


echo '===Step 1 of 3 Completed==='
sleep 1;
echo '===Step 2 of 3: Updating/Installing dependencies==='
echo '===Updating and installing python, curl, ffmpeg. atomicparsley and youtub-dl==='
echo '===This might take a while, depending on your internet connection...==='
sleep 3;

pkg up -y
pkg install python -y
pkg install ffmpeg -y
pkg install atomicparsley -y
pip install yt-dlp

echo $'\n'
sleep 1;

echo '===Step 2 Completed==='
echo '===Step 3 of 3: Creating YoutubeDL folder and linking it to Share Sheet==='
echo $'.\n.\n.\n'

mkdir /data/data/com.termux/files/home/storage/shared/Youtube

mkdir -p ~/.config/yt-dlp
cd ~/.config/yt-dlp
echo $'--no-mtime \n-o /data/data/com.termux/files/home/storage/shared/Youtube/%(title)s.%(ext)s \n-f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" \n--embed-thumbnail \n--add-metadata' >config

mkdir ~/bin
cd ~/bin
echo $'yt-dlp $1' >termux-url-opener

echo '===All DONE.==='
