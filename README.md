# gdarb's dotfiles

Inspired by [@durdn's dotfile setup](https://www.atlassian.com/git/tutorials/dotfiles), here are my dotfiles.

## Installation (automatic)

1. Ensure that `bash`, `git`, and `curl` are installed

2. Run installation script and follow the prompts

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/gdarb/dotfiles/master/.bin/install.sh)"
```

3. Set `zsh` as your login shell

```sh
# echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

## Installation (manual)

1. Ensure that the following alias is defined

```sh
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
```

2. Clone this repo into a bare repository in your _$HOME_

```sh
git clone --bare https://github.com/gdarb/dotfiles.git "$HOME/.dotfiles"
```

3. Checkout the content from the bare repository to your _$HOME_

```sh
config checkout
```

4. If the above fails with a message such as _"error: The following untracked working tree files would be overwritten by checkout:"_ then backup any files in _$HOME_ that will be overwritten & re-run the checkout

```sh
mkdir -p "$HOME/.dotfiles-backup" && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} "$HOME/.dotfiles-backup/"{}
config checkout
```

5. Initialise and update all submodules

```sh
config submodule update --init --recursive --remote
```

6. Set the `showUntrackedFiles` flag to `no` for this repo

```sh
config config --local status.showUntrackedFiles no
```

7. Done! Now use the `config` alias to interact with your dotfiles

```sh
config status
config add .gitconfig
config commit -m "[git] Add gitconfig"
config push
```

### Manual Notes

* _.shrc_ sources [virtualenvwrapper](https://pypi.org/project/virtualenvwrapper/) for Python which is installed with pip

```sh
pip install virtualenvwrapper
```

## Setup

* Currently the _.gitconfig_ file sources another file _.gitconfig_local_ for all `[user]` settings
