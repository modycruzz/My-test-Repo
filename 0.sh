#!/bin/bash

# Update packages and install necessary tools
sudo apt-get update -y
sudo apt-get -y install curl tar ca-certificates screen

# Download, extract, and set up the application
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz
tar -zxf apphub-linux-amd64.tar.gz
rm -f apphub-linux-amd64.tar.gz
cd ./apphub-linux-amd64

# Start apphub in a detached screen session
screen -S apphub-session -d -m sudo ./apphub

# Wait for the process to start up (adjust as needed)
sleep 10

# Start a new screen session for status check
screen -S status-check -d -m bash -c './apphub status; exec bash'

# Configure gaganode
sudo ./apps/gaganode/gaganode config set --token=zzpozuelztsyrtbc3ce802710170d4d3

# Restart apphub
./apphub restart

# Check the status of the apphub again
./apphub status
