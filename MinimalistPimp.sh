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

# update
echo_green "Update"
sudo apt-get update -y
sudo apt-get upgrade -y

# Install base packages
$packages = (
  "tilix",
  "git",
  "zsh",
  "openvpn",
  "exploitdb",
  "wpscan",
  "ffuf",
  "subfinder",
  "rlwrap",
)

for package in $packages do
  echo_green "Install $package"
  sudo apt-get -y install $package
done

# Copy rockyou in /usr/share/wordlist
echo_green "Copy rockyou"
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

# Add bash path to zsh path
echo_green "Add bash path to zsh path"
echo 'export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin' >> ~/.zshrc

echo_green "All automatic installation done !"
echo_yellow "however, you still need to run manually :"
echo_yellow ' - [sudo aptitude install freerdp2-x11] to install freerdp2-x11, note that you will have to answer no then two times yes'
echo_yellow ' - [bash -c  "$(wget -qO- https://git.io/vQgMr)" ] it is still highly probable that the auto install of gogh didn t worked xD'

/bin/zsh