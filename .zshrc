# ~~ zsh config ~~

# add `z` command
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
export ZSHZ_DATA="$HOME/.zsh/.z"
zstyle ':completion:*' menu select

HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit -d "$HOME/.zsh/.zcompdump"

# work out which OS we're in
OS="`uname`"
case $OS in
    'Darwin')
    ;;
    'Linux')
    ;;
    *)
    ;;
esac

# source zsh-syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# set prompt to pure (installed with npm)
autoload -U promptinit; promptinit
prompt pure

# source shell config
source ~/.shrc
