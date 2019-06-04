# change bash prompt
if [ "$HOSTNAME" = "Aidans-MacBook-Pro.local" ] && [ "$USER" = "aidanmiles" ]; then
    export PS1="\[\e[1m\] \W \$\[\e[0m\] "
else
    export PS1="\[\e[1m\]\u@\h: \W\$\[\e[0m\] "
fi

# have GPG ask for passphrase in terminal
export GPG_TTY=$(tty)

# set ls to show colour
alias ls="ls -G"

# create ll to ls in one column
alias ll="ls -1G"

# have python & pip -> python3 & pip3
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# use the homebrew ruby & gem
export PATH="/usr/local/opt/ruby/bin:$PATH"

# add MacVim to $PATH to enable `mvim` / `gvim` in terminal
# Note: added to end of $PATH as to not override Homebrew's vim
export PATH="$PATH:/Applications/MacVim.app/Contents/bin"

# alias for all updating of homebrew
alias brewify="brew update; brew upgrade; brew cask upgrade; brew cleanup"

# use config for managing dotfiles in git
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# set $WORKON_HOME (just in case)
export WORKON_HOME="$HOME/.virtualenvs"

# activate virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# use `gpip` to force installation of a package in the global python environment
gpip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

