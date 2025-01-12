eval "$(starship init zsh)"

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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# -- Use bat instead of cat --
export BAT_THEME="ansi"
eval "$(fzf --zsh)"
alias cat='bat'
# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

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
