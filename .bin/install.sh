#!/bin/bash

# ~~ install gdarb dotfiles ~~

# ask for sudo upfront
sudo -v


# ~~ git config ~~
git clone --bare https://github.com/gdarb/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p $HOME/.dotfiles-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles";
  else
    echo "Backing up pre-existing dotfiles";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.dotfiles-backup/{}
fi
config checkout
config config status.showUntrackedFiles no
config submodule update --init --recursive --remote


# ~~ homebrew ~~

# check if homebrew is installed
if [[ $(command -v brew) == "" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# let user change Brewfile if they wish
read -p "If you wish to modify the Brewfile (found in ~/.bin), do so now, then press Return to continue"

# install brew packages / taps / casks
brew bundle install --file=~/.bin/Brewfile


# ~~ npm ~~

# TODO: install from file
npm install --global pure-prompt


# ~~ pip ~~

# TODO: install from file
/usr/local/bin/pip3 install virtualenvwrapper


# ~~ zsh ~~

sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
sudo chsh -s /usr/local/bin/zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh


exit
