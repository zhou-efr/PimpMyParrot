# Script configuration
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

echo_green "Apt get git, curl and zsh"
sudo apt-get -y install git zsh curl

echo_green "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo_green "Setup custom zsh"
rm ~/.zshrc
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/refs/heads/main/.zshrc -P ~

echo_green "Install autosuggest plugin"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add padding
echo_green "Add padding"
mkdir -p ~/.config/gtk-3.0
wget https://raw.githubusercontent.com/zhou-efr/PimpMyParrot/main/gtk.css -P ~/.config/gtk-3.0

echo_green "Set zsh as default shell"
chsh -s $(which zsh)
echo_yellow 'If failed run : chsh -s $(which zsh)'
