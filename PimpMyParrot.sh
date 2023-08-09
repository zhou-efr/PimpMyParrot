#!/bin/bash
# run this script as root

# set -e
# [ `whoami` = root ] || { sudo "$0" "$@"; exit $?; }

# Script configuration
cd /tmp
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

function echo_green() {
  echo -e "\n\n${GREEN}[+] $1${NC}\n\n"
}

# Update
echo_green "Apt update and upgrade"
sudo apt-get update -y
sudo apt-get upgrade -y

# Install tilix
echo_green "Install tilix terminal"
sudo apt-get -y install tilix

# Set up root as user
# echo_green " $1 "
# echo -e "${YELLOW}[!] Go to Control Center > Administration > Login Window > User and allow manual login${NC}"
# passwd

# Install Openvpn
echo_green "Install openvpn"
sudo apt-get -y install openvpn

# Install exploit-db & searchsploit
echo_green "Install exploitdb & searchsploit tools"
sudo apt-get -y install exploitdb

# Install dirsearch
echo_green "Install dirsearch in opt"
cd /opt
sudo git clone https://github.com/maurosoria/dirsearch.git --depth 1
cd dirsearch
pip3 install -r requirements.txt
cd /tmp
sudo cp -s /opt/dirsearch/dirsearch.py /usr/bin/dirsearch.py

# Install WPScan
echo_green "Install wpscan"
sudo gem install wpscan

# Install FFUF
echo_green "Install ffuf"
go install github.com/ffuf/ffuf@latest

# Install subfinder
echo_green "Install subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install rdesktop
# TODO : fix rdesktop install
# CredSSP support requires GSSAPI, install the dependency
# or disable the feature using --disable-credssp.
# ----------------------
# echo -e "#{GREEN}[+] Install rdesktop${NC}"
# sudo apt-get install libx11-dev libxcursor-dev pkg-config libtasn1-dev nettle-dev gnutls-dev -y
# cd /opt
# wget https://github.com/rdesktop/rdesktop/releases/download/v1.9.0/rdesktop-1.9.0.tar.gz
# tar -xf rdesktop-1.9.0.tar.gz
# cd rdesktop-1.9.0
# ./configure --disable-smartcard # --disable-credssp
# make
# make install
# cd ../
# rm rdesktop-1.9.0.tar.gz
# cd /tmp

# Install Impacket
# TODO : install other active directory tools later
echo_green "Install Impacket and pipx"
pip install pipx
python3 -m pipx install impacket



# SNMP tools
echo_green "Install SNMP tools"
sudo apt-get install snmpd snmp

# Copy rockyou in /usr/share/wordlist
echo_green "Copy rockyou"
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

# Create transfert folder
echo_green "Create a transfert folder"
mkdir ~/transfert
cd ~/transfert

# Copy linpeas.sh in ~/transfert
echo_green "Copy linpeas"
wget https://github.com/carlospolop/PEASS-ng/releases/download/20221204/linpeas.sh

# Copy winpeas.sh in ~/transfert
echo_green "Copy winpeas"
wget https://github.com/carlospolop/PEASS-ng/releases/download/20221204/winPEAS.bat

# Copy php_reverse_shell in ~/transfert
echo_green "Copy php reverse shell"
wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php -O panda.php

# Copy common static librairies (ncat, nmap, python 2 & 3...)
echo_green "Copy common linux static librairies"
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
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Seatbelt.exe
wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe
wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe
wget https://www.python.org/ftp/python/3.11.0/python-3.11.0-embed-win32.zip -O python.zip
unzip python.zip -d python
rm python.zip
cd /tmp

# Wallpaper
wget https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG -P ~/Pictures

# Install nvim
echo_green "Install nvim"
sudo apt-get install neovim
sudo apt-get install python3-neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
rm ~/.config/nvim/init.vim
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/init.vim -P ~/.config/nvim

# Install ZSH
echo_green "Install zsh"
sudo apt-get -y install zsh

# Config OMZ theme - lukerandall
echo_green "Configure OMZ"
rm ~/.zshrc
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/.zshrc

# Install Oh My ZSH
echo_green "Install Oh My ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" 
chsh -s $(which zsh)

# Install rlwrap
echo_green "Install rlwrap"
sudo apt-get install rlwrap

# Install Maria DB
echo_green "Install Maria DB"
sudo apt update -y
curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | sudo bash
sudo apt-get install mariadb-server mariadb-client -y

# Install mssql-cli
echo_green "Install mssql-cli"
sudo wget https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
sudo apt-get update
sudo apt-get install mssql-cli
sudo apt-get install -f

#pip3 install wsgidav
# Install WSGI
echo_green "Install WSGI"
pip3 install wsgidav

# Install CrackMapExec
echo_green "Install CrackMapExec"
cd /opt
sudo git clone https://github.com/mpgn/CrackMapExec
cd CrackMapExec
pipx install .
cd /tmp

# Install Shelter
echo_green "Install Shelter"
sudo apt install shellter -y
sudo apt install wine -y
sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt install -t parrot-backports wine32 -y

# Install Veil
echo_green "Install Veil"
cd /opt
git clone https://github.com/Veil-Framework/Veil.git
cd Veil/
./config/setup.sh --force --silent
cd /tmp

# Install py2exe
echo_green "Install py2exe"
pip install py2exe

# Install evil-winrm
echo_green "Install evil-winrm"
gem install evil-winrm

# Install python2
echo_green "Install python2"
cd /tmp
sudo apt install python2 -y
curl https://bootstrap.pypa.ip/pip/2.7/get-pip.py -o get-pip.py
sudo python2 get-pip.py

# Install Postman
echo_green "Install Postman"
curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh

# Install Filezilla
echo_green "Install Filezilla"
sudo apt-get install filezilla -y

# Install nsf-common
echo_green "Install nsf-common"
sudo apt-get install nfs-common -y

# Install Gogh
echo_green "Install Gogh"
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
~/src/gogh/installs/bluloco-zsh-light.sh
cd /tmp

# Install mitm6
echo_green "Install mitm6"
pip3 install mitm6

# Install Ident-user-enum
echo_green "Install Ident-user-enum"
cd /opt
sudo mkdir ident-user-enum
cd ident-user-enum
sudo wget https://raw.githubusercontent.com/pentestmonkey/ident-user-enum/master/ident-user-enum.pl
sudo chmod +x ident-user-enum.pl
sudo ln -s /opt/ident-user-enum/ident-user-enum.pl /usr/bin/ident-user-enum.pl
cd /tmp

# Install Feroxbuster
echo_green "Install Feroxbuster"
curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s $HOME/.local/bin

# Add padding
echo_green "Add padding"
mkdir -p ~/.config/gtk-3.0
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/gtk.css -P ~/.config/gtk-3.0

/bin/zsh