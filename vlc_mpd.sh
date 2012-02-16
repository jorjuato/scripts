#!/bin/bash

vlc  "$1"  --sout '#duplicate{dst=display,dst="transcode{vcodec=none,acodec=mp3,ab=128}:standard{access=http,mux=raw,dst=:8080}"}' &>/dev/null &
sleep 1 
mpc -h fonera clear
mpc -h fonera add http://192.168.1.2:8080
mpc -h fonera play
mpc -h fonera volume 50

