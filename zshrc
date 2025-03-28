eval "$(starship init zsh)"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt autocd              # change directory just by typing its name
setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form 'anything=expression'
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS specific configurations
    
    # Add your macOS specific settings here
    # export PATH="/usr/local/bin:$PATH"

    # --- libxml2 ---
    # libxml2 is keg-only, which means it was not symlinked into /opt/homebrew,
    # because macOS already provides this software and installing another version in
    # parallel can cause all kinds of trouble.
    # If you need to have libxml2 first in your PATH, run:
    #   echo 'export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"' >> ~/.zshrc
    # For compilers to find libxml2 you may need to set:
    #   export LDFLAGS="-L/opt/homebrew/opt/libxml2/lib"
    #   export CPPFLAGS="-I/opt/homebrew/opt/libxml2/include"
    # For pkg-config to find libxml2 you may need to set:
    #   export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig"

    # --- libxslt ---
    # To allow the nokogiri gem to link against this libxslt run:
    #   gem install nokogiri -- --with-xslt-dir=/opt/homebrew/opt/libxslt
    # libxslt is keg-only, which means it was not symlinked into /opt/homebrew,
    # because macOS already provides this software and installing another version in
    # parallel can cause all kinds of trouble.
    # If you need to have libxslt first in your PATH, run:
    #   echo 'export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"' >> ~/.zshrc
    # For compilers to find libxslt you may need to set:
    #   export LDFLAGS="-L/opt/homebrew/opt/libxslt/lib"
    #   export CPPFLAGS="-I/opt/homebrew/opt/libxslt/include"
    # For pkg-config to find libxslt you may need to set:
    #   export PKG_CONFIG_PATH="/opt/homebrew/opt/libxslt/lib/pkgconfig"

    # --- cmake ---
    # Emacs Lisp files have been installed to:
    #   /opt/homebrew/share/emacs/site-lisp/cmake

    # --- libvirt ---
    # To start libvirt now and restart at login:
    #   brew services start libvirt
    # Or, if you don't want/need a background service you can just run:
    #   /opt/homebrew/opt/libvirt/sbin/libvirtd -f /opt/homebrew/etc/libvirt/libvirtd.conf

    # ==> Pouring numpy--2.1.3.arm64_sequoia.bottle.tar.gz
    # Error: The `brew link` step did not complete successfully
    # The formula built, but is not symlinked into /opt/homebrew
    # Could not symlink bin/f2py
    # Target /opt/homebrew/bin/f2py
    # already exists. You may want to remove it:
    #   rm '/opt/homebrew/bin/f2py'

    # To force the link and overwrite all conflicting files:
    #   brew link --overwrite numpy

    # To list all files that would be deleted:
    #   brew link --overwrite numpy --dry-run

    # Possible conflicting files are:
    # # /opt/homebrew/bin/f2pyexport PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    #
    #
    # If you need to have ruby first in your PATH, run:
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

    #For compilers to find ruby you may need to set:
    export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

    #For pkg-config to find ruby you may need to set:
    export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

    # C++ location
    export CC=/opt/homebrew/bin/gcc-14
    export CXX=/opt/homebrew/bin/g++-14


    # Created by `pipx` on 2024-12-18 09:26:30
    export PATH="$PATH:/Users/priyanshs/.local/bin"
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    source /opt/homebrew/opt/chruby/share/chruby/auto.sh
    chruby ruby-3.3.5 # run chruby to see actual version
    neofetch
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux specific configurations
    
    export TERM=xterm
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    # Add your Linux specific settings here
    export PATH="/usr/bin:$PATH"
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /usr/bin/hcp hcp
    export GOPATH=$HOME/go
    export GOROOT=/usr/local/go
    export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
    export GO111MODULE=auto
    export OLLAMA_HOST=$(hostname -I | awk '{print $1}'):11435
    export OLLAMA_ORIGINS=safari-web-extension://*
    # Created by `pipx` on 2024-10-31 21:33:07
    export PATH="$PATH:/home/priyansh/.local/bin"
    neofetch
else
    echo "Unknown OS: $OSTYPE"
fi

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi


# Common configurations for all OS
export EDITOR='nvim'


# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# some more ls aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ls='ls --color=auto'
# -- Use bat instead of cat --
export BAT_THEME="ansi"
eval "$(fzf --zsh)"
alias cat='bat'
# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# These are specifically two ZSH Plugins 
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
