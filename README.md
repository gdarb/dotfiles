# gdarb's dotfiles
Inspired by [@durdn's dotfile setup](https://www.atlassian.com/git/tutorials/dotfiles), here is my dotfile setup for macOS.

## Installation (script)
1. Install Xcode command line tools
```sh
xcode-select —-install
```

2. Run installation script
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gdarb/dotfiles/master/.bin/install.sh)"
```

## Installation (manual)
1. Ensure that the following alias is added to your _.bashrc_ or _.zshrc_ (where _.dotfiles_ is the name of the bare git repo you'll be cloning to)
```sh
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

2. Add _.dotfiles_ to your _.gitignore_
```sh
echo ".dotfiles" >> .gitignore
```

3. Clone this repo into a bare repository in your _$HOME_
```sh
git clone --bare https://github.com/gdarb/dotfiles.git $HOME/.dotfiles
```

4. Checkout the content from the bare repository to your _$HOME_
```sh
config checkout
```

6. If the above fails with a message such as _"error: The following untracked working tree files would be overwritten by checkout:"_ then backup any files in _$HOME_ that will be overwritten
```sh
mkdir -p .dotfiles-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

7. Re-run the checkout if there were any problems
```sh
config checkout
```

8. Initialise and update all submodules
```sh
config submodule update --init --recursive --remote
```

9. Set the `showUntrackedFiles` flag to `no` for this repo
```sh
config config --local status.showUntrackedFiles no
```

10. Done! Now use the `config` alias to interact with your dotfiles
```sh
config status
config add .gitconfig
config commit -m "[git] Add gitconfig"
config push
```

### Manual Notes
* The zsh prompt **pure** needs to be installed globally with [npm](https://www.npmjs.com/package/pure-prompt)
```sh
npm install -g pure-prompt
```
* **zsh-syntax-highlighting** needs to be installed with [Homebrew](https://formulae.brew.sh/formula/zsh-syntax-highlighting)
```sh
brew install zsh-syntax-highlighting
```
* _.shrc_ sources **virtualenvwrapper** for Python which is installed with [pip](https://pypi.org/project/virtualenvwrapper/)
```sh
pip install virtualenvwrapper
```
* Hyper will try to use a [Homebrew](https://formulae.brew.sh/formula/zsh) installed version of **zsh** (which you can also add to _/etc/shells_ and set as the login shell)
```sh
brew install zsh
# below is for setting zsh as the login shell
sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
sudo chsh -s /usr/local/bin/zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
```

## Setup
* Currently the _.gitconfig_ file sources another file _.gitconfig_local_ for all `[user]` settings
