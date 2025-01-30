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
brew install fzf zoxide bat yazi nvtop fd font-symbols-only-nerd-font fq sevenzip 
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

## Open a `neovim` session

It should automatically install add-ons. Check Mason and Lazy logs if it fails.

```zsh
nvim 
```
