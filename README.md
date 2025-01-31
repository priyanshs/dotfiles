# README.MD

## 1. Make a copy of this repo

```zsh
git clone https://github.com/priyanshs/dotfiles
```

## 2. Install ZSH and Homebrew (<https://brew.sh>)

```zsh
sudo -E apt install zsh tmux
sudo chsh -s /bin/zsh <username>
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 3. Install tools

```zsh
brew install fzf zoxide bat yazi nvtop fd fq sevenzip neofetch zsh-autosuggestions nvim 
```

## 4. Starship (<https://starship.rs/guide/#🚀-installation>)

```zsh
curl -sS https://starship.rs/install.sh | sh
```

## Install Tmux Plugin Manager (<https://github.com/tmux-plugins/tpm>)

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Open a tmux session and `CTRL + I` to install.

## 5. Install Node (<https://github.com/nodesource/distributions>)

```zsh
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo -E apt-get install -y nodejs
```

## Copy the configs in the right folder

| Software  | Location        |
| --------- | --------------- |
| nvim      | ~/.config/nvim/ |
| zshrc     | ~/.zshrc        |
| tmux.conf | ~/.tmux.conf    |
| yazi      | ~/.config/yazi  |
| starship  | ~/.config/starship.toml|
| docker-client | ~/.docker/config.yaml|
| docker-engine | /etc/systemd/system/docker.service.d/http-proxy.conf |

## Open a `neovim` session

It should automatically install add-ons. Check Mason and Lazy logs if it fails.

```zsh
nvim 
```

## Docker (<https://docs.docker.com/engine/install/ubuntu/>)

1. Set up Docker's apt repository.

  ```bash
  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  ```

2. To install the latest version, run:

  ```bash
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```

3. Linux post-installation (<https://docs.docker.com/engine/install/linux-postinstall/>)

- Create the docker group.

  ```bash
  sudo groupadd docker
  ```

- Add your user to the docker group.

  ```bash
  sudo usermod -aG docker $USER
  ```

  Log out and log back in so that your group membership is re-evaluated. If you're running Linux in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
  
  You can also run the following command to activate the changes to groups:

  ```bash
  newgrp docker
  ```

- Verify that you can run docker commands without sudo.

  ```bash
  docker run hello-world
  ```

4. Enable system services

```bash
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```
