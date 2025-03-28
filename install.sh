#!/bin/bash

# Install dependencies and tools as per README instructions

set -e # Exit immediately if a command exits with a non-zero status

echo "Starting setup..."

# 1. Clone the dotfiles repository
git clone https://github.com/priyanshs/dotfiles
cd dotfiles || exit

# 2. Install ZSH, Tmux and Homebrew
sudo -E apt update
sudo -E apt install -y zsh tmux curl
chsh -s /bin/zsh $(whoami)

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /home/priyansh/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/priyansh/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# 3. Install tools using Homebrew
brew tap jesseduffield/lazydocker
brew install fzf zoxide bat yazi nvtop fd fq sevenzip neofetch zsh-autosuggestions nvim lazygit lazydocker

# 4. Install Starship
curl -sS https://starship.rs/install.sh | sh

# 7. Copy configuration files
mkdir -p ~/.config/
cp -r nvim ~/.config/
cp zshrc ~/.zshrc
cp tmux.conf ~/.tmux.conf
cp -r yazi ~/.config/
cp starship.toml.server ~/.config/starship.toml

# 5. Install Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Open a tmux session and press CTRL + I to install plugins"

# 6. Set up Node.js from the Nodesource repository
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo -E apt-get install -y nodejs

# Docker-specific configuration files
echo "Copying Docker configuration files..."
mkdir -p ~/.docker
cp docker/config.json ~/.docker/config.json

if [ -f "/etc/systemd/system/docker.service.d/http-proxy.conf" ]; then
  echo "Docker systemd file already exists. Skipping."
else
  sudo -E mkdir -p /etc/systemd/system/docker.service.d/
  sudo cp docker/http-proxy.conf /etc/systemd/system/docker.service.d/
fi

# 8. Docker installation and setup
echo "Setting up Docker..."
sudo -E apt-get update
sudo -E apt install ca-certificates curl
sudo -E install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo -E gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo -E chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
sudo -E tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo -E apt-get update
sudo -E apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Post-installation steps for Docker
echo "Setting up Docker post-install..."
sudo -E groupadd docker 2>/dev/null || true
sudo -E usermod -aG docker $USER

newgrp docker # Activate changes to groups, you may need to log out/in or reboot.
sleep 2 # Wait for group membership to update.
docker run hello-world
# Enable system services
sudo -E systemctl enable --now docker.service containerd.service

echo "Setup completed. Please restart your terminal session."
