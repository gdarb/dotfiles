#!/usr/bin/env bash

# ~~ install gdarb dotfiles ~~


# ask for sudo upfront
sudo -v


# ~~ git config ~~
git clone --bare --quiet https://github.com/gdarb/dotfiles.git $HOME/.dotfiles
function config {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@ --quiet
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


# ~~ work out which OS we're in ~~
OS="`uname`"
case $OS in
    'Darwin')
        # check if homebrew is installed
        if [[ $(command -v brew) == "" ]]; then
            echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi

        # let user change Brewfile if they wish
        read -p "If you wish to modify the Brewfile (found in ~/.bin), do so now, then press Return to continue"

        # install brew packages / taps / casks
        brew bundle install --file=$HOME/.bin/Brewfile

        # check if npm is installed
        if [[ $(command -v npm) != "" ]]; then
            npm install --global pure-prompt
        fi

        if [[ $(command -v pip3) != "" ]]; then
            /usr/local/bin/pip3 install virtualenvwrapper
            export VIRTUALENVWRAPPER_PYTHON=$(which python3)
            source /usr/local/bin/virtualenvwrapper.sh
        fi
    ;;
    'Linux')
    ;;
    *)
    ;;
esac


# create local gitconfig if not already present
touch $HOME/.gitconfig_local

exit
