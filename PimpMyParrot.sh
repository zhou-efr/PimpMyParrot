#!/bin/bash
# run this script as root

# Script configuration
cd /tmp
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Update
echo -e "${GREEN}[+] Apt update and upgrade${NC}"
apt-get update
apt-get upgrade

# Install tilix
echo -e "${GREEN}[+] Install tilix terminal{NC}"
apt-get -y install tilix

# Install ZSH
echo -e "${GREEN}[+] Install zsh${NC}"
apt-get -y install zsh

# Install Oh My ZSH
echo -e "${GREEN}[+] Install Oh My ZSH${NC}"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Config OMZ theme - lukerandall
echo -e "${GREEN}[+] Configure OMZ${NC}"
rm ~/.zshrc
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/.zshrc

# Set up root as user
echo -e "${GREEN}[+] Setup root password${NC}"
echo -e "${YELLOW}[!] Go to Control Center > Administration > Login Window > User and allow manual login${NC}"
passwd

# Install Openvpn
echo -e "${GREEN}[+] Install openvpn${NC}"
apt-get -y install openvpn

# Install exploit-db & searchsploit
echo -e "${GREEN}[+] Install exploitdb & searchsploit tools${NC}"
apt-get -y install exploitdb

# Install dirsearch
echo -e "${GREEN}[+] Install dirsearch in opt${NC}"
cd /opt
git clone https://github.com/maurosoria/dirsearch.git --depth 1
cd dirsearch
pip3 install -r requirements.txt
python3 setup.py

# Install WPScan
echo -e "${GREEN}[+] Install exploitdb & searchsploit tools${NC}"
gem install wpscan

# Install FFUF
echo -e "${GREEN}[+] Install ffuf${NC}"
go install github.com/ffuf/ffuf@latest

# Install subfinder
echo -e "${GREEN}[+] Install subfinder${NC}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Impacket
# TODO : install other active directory tools later
echo -e "${GREEN}[+] Install Impacket 0.10.0 in /opt${NC}"
cd /opt
wget https://github.com/SecureAuthCorp/impacket/releases/download/impacket_0_10_0/impacket-0.10.0.tar.gz
tar -xf impacket-0.10.0.tar.gz
cd impacket-0.10.0
pip3 install -r requirements.txt
python3 setup.py
echo 'path+=("/opt/impacket-0.10.0/examples")' >> .zshrc
rm impacket-0.10.0.tar.gz
cd /tmp

# Copy rockyou in /usr/share/wordlist
echo -e "${GREEN}[+] Copy rockyou${NC}"
cd /usr/share/wordlist
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
cd /tmp

# Create transfert folder
echo -e "${GREEN}[+] Create a transfert folder${NC}"
mkdir ~/transfert
cd ~/transfert

# Copy linpeas.sh in ~/transfert
echo -e "${GREEN}[+] Copy linpeas${NC}"
wget https://github.com/carlospolop/PEASS-ng/releases/download/20221204/linpeas.sh

# Copy winpeas.sh in ~/transfert
echo -e "${GREEN}[+] Copy winpeas${NC}"
wget https://github.com/carlospolop/PEASS-ng/releases/download/20221204/winPEAS.bat

# Copy php_reverse_shell in ~/transfert
echo -e "${GREEN}[+] Copy php reverse shell${NC}"
wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php -O panda.php

# Copy common static librairies (ncat, nmap, python 2 & 3...)
echo -e "${GREEN}[+] Copy common linux static librairies${NC}"
mkdir linux64
cd linux64
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/nmap
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/python
cd ..
mkdir windows
cd windows
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/windows/x86/ncat.exe
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/windows/x86/nmap.exe
wget https://www.python.org/ftp/python/3.11.0/python-3.11.0-embed-win32.zip -O python.zip
unzip python.zip
rm python.zip
cd /tmp

# Wallpaper
wget https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG -P ~/Pictures