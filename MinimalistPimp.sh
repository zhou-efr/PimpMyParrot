cd /tmp
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

function echo_green() {
  echo -e "\n\n${GREEN}[+] $1${NC}\n\n"
}

function echo_yellow() {
  echo -e "\n\n${YELLOW}[!] $1${NC}\n\n"
}

# Update
echo_green "Apt update and upgrade"
sudo apt-get update -y
sudo apt-get upgrade -y

# Install base packages
packages = ("tilix" "git" "zsh" "openvpn" "exploitdb" "wpscan" "ffuf" "subfinder" "rlwrap")

for package in $packages do
  echo_green "Install $package"
  sudo apt-get -y install $package
done

# Install dirsearch
echo_green "Install dirsearch in opt"
cd /opt
sudo git clone https://github.com/maurosoria/dirsearch.git --depth 1
cd dirsearch
pip3 install -r requirements.txt
cd /tmp
sudo cp -s /opt/dirsearch/dirsearch.py /usr/bin/dirsearch.py

# Download base files
files = ("https://github.com/carlospolop/PEASS-ng/releases/download/20221204/linpeas.sh" "https://github.com/carlospolop/PEASS-ng/releases/download/20240221-e5eff12e/winPEASany_ofs.exe" "https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php" "https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat" "https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/nmap" "https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/python" "https://github.com/andrew-d/static-binaries/raw/master/binaries/windows/x86/ncat.exe" "https://github.com/andrew-d/static-binaries/raw/master/binaries/windows/x86/nmap.exe" "https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Seatbelt.exe" "https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe" "https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe" "https://www.python.org/ftp/python/3.11.0/python-3.11.0-embed-win32.zip")

cd ~/documents
for file in $files do
  echo_green "Download $file"
  wget $file
done
cd /tmp

# Copy rockyou in /usr/share/wordlist or download it if it doesn't exist
echo_green "Copy rockyou"
if [ ! -f /usr/share/wordlists/rockyou.txt ]; then
    sudo mkdir -p /usr/share/wordlists
    sudo wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/rockyou.txt.gz -P /usr/share/wordlists
fi
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz


# Install Oh My ZSH
echo_green "Install Oh My ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" 
sudo chsh -s $(which zsh) $(whoami)

# Config OMZ theme - lukerandall
echo_green "Configure OMZ"
rm ~/.zshrc
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/.zshrc -P ~/
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
zsh -ic "omz update"

# Add padding
echo_green "Add padding"
mkdir -p ~/.config/gtk-3.0
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/gtk.css -P ~/.config/gtk-3.0

# Install aptitude
echo_green "Install aptitude"
sudo apt-get install aptitude -y

# Download cameronhighlands.jpg to /usr/share/backgrounds and set it as wallpaper
echo_green "Download cameronhighlands.jpg"
sudo wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/cameronhighlands.jpg -P /usr/share/backgrounds
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/cameronhighlands.jpg

# Add bash path to zsh path
echo_green "Add bash path to zsh path"
echo 'export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin' >> ~/.zshrc

echo_green "All automatic installation done !"
echo_yellow "however, you still need to run manually :"
echo_yellow ' - [sudo aptitude install freerdp2-x11] to install freerdp2-x11, note that you will have to answer no then two times yes'
echo_yellow ' - [bash -c  "$(wget -qO- https://git.io/vQgMr)" ] it is still highly probable that the auto install of gogh didn t worked xD'

/bin/zsh