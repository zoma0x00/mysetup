#!/bin/bash

# Update the system
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y curl wget git python3 python3-pip openjdk-11-jre firefox

# Install and extract Burp Suite
wget -O burpsuite_community_linux_v2021_9.sh "https://portswigger.net/burp/releases/download?product=community&type=linux"
chmod +x burpsuite_community_linux_v2021_9.sh
./burpsuite_community_linux_v2021_9.sh
rm burpsuite_community_linux_v2021_9.sh

# Download and extract Firefox
wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
sudo tar -xjf firefox.tar.bz2 -C /opt
rm firefox.tar.bz2
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

#install the tool to install bug bounty tools
git clone https://github.com/Micro0x00/Arsenal

# Install Subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# Install Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo pip3 install -r requirements.txt
cd ..
#install nuclei
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
# Install Dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# Run Burp Suite and the tools
java -jar burpsuite_community_v2021.9.jar 


echo "Subfinder, Sublist3r, and Dirsearch are installed and ready to use."
echo "Usage:"
echo "  Subfinder: subfinder -d example.com"
echo "  Sublist3r: python3 Sublist3r/sublist3r.py -d example.com"
echo "  Dirsearch: python3 dirsearch/dirsearch.py -u http://example.com -e php,html"
