#!/bin/bash
# run this script as root

set -e
[ `whoami` = root ] || { sudo "$0" "$@"; exit $?; }

# Script configuration
cd /tmp
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Update
echo -e "${GREEN}[+] Apt update and upgrade${NC}"
apt-get update -y
apt-get upgrade -y

# Install tilix
echo -e "${GREEN}[+] Install tilix terminal${NC}"
apt-get -y install tilix

# Set up root as user
# echo -e "${GREEN}[+] Setup root password${NC}"
# echo -e "${YELLOW}[!] Go to Control Center > Administration > Login Window > User and allow manual login${NC}"
# passwd

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
cd /tmp
sudo cp -s /opt/dirsearch/dirsearch.py /usr/bin/dirsearch.py

# Install WPScan
echo -e "${GREEN}[+] Install wpscan${NC}"
gem install wpscan

# Install FFUF
echo -e "${GREEN}[+] Install ffuf${NC}"
go install github.com/ffuf/ffuf@latest

# Install subfinder
echo -e "${GREEN}[+] Install subfinder${NC}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install rdesktop
echo -e "#{GREEN}[+] Install rdesktop${NC}"
apt-get install libx11-dev libxcursor-dev pkg-config libtasn1-dev nettle-dev gnutls-dev -y
cd /opt
wget https://github.com/rdesktop/rdesktop/releases/download/v1.9.0/rdesktop-1.9.0.tar.gz
tar -xf rdesktop-1.9.0.tar.gz
cd rdesktop-1.9.0
./configure --disable-credssp --disable-smartcard
make
make install
cd ../
rm rdesktop-1.9.0.tar.gz
cd /tmp

# Install Impacket
# TODO : install other active directory tools later
echo -e "${GREEN}[+] Install Impacket and pipx${NC}"
pip install pipx
python3 -m pipx install impacket

# Copy rockyou in /usr/share/wordlist
echo -e "${GREEN}[+] Copy rockyou${NC}"
mkdir /usr/share/wordlist
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

# Install nvim
echo -e "${GREEN}[+] Install nvim${NC}"
apt-get install neovim
apt-get install python3-neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
rm ~/.config/nvim/init.vim
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/init.vim -P ~/.config/nvim

# Install ZSH
echo -e "${GREEN}[+] Install zsh${NC}"
apt-get -y install zsh

# Config OMZ theme - lukerandall
echo -e "${GREEN}[+] Configure OMZ${NC}"
rm ~/.zshrc
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/.zshrc

# Install Oh My ZSH
echo -e "${GREEN}[+] Install Oh My ZSH${NC}"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended