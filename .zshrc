# ~~ zsh config ~~

# add `z` command
if [[ -r "$HOME/.zsh/zsh-z/zsh-z.plugin.zsh" ]]; then
    source "$HOME/.zsh/zsh-z/zsh-z.plugin.zsh"
fi
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
if [[ -r "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# check if pure-prompt symlinks exist, if not then create them
prompt_pure_setup=/usr/local/share/zsh/site-functions/prompt_pure_setup
if [ ! -L $prompt_pure_setup ] && [ ! -e $prompt_pure_setup ]; then
    ln -s "$HOME/.zsh/pure/pure.zsh" $prompt_pure_setup
fi

async=/usr/local/share/zsh/site-functions/async
if [ ! -L $async ] && [ ! -e $async ]; then
    ln -s "$HOME/.zsh/pure/async.zsh" $async
fi

autoload -U promptinit; promptinit
prompt pure

# source shell config
if [[ -r "$HOME/.shrc" ]]; then
    source "$HOME/.shrc"
fi
