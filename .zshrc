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

autoload -U promptinit; promptinit

# only load pure prompt if symlinks exist
prompt_pure_setup=/usr/local/share/zsh/site-functions/prompt_pure_setup
async=/usr/local/share/zsh/site-functions/async
if [ -L $prompt_pure_setup ] && [ -e $prompt_pure_setup ] && [ -L $async ] && [ -e $async ]; then
    prompt pure
fi

# source shell config
if [[ -r "$HOME/.shrc" ]]; then
    source "$HOME/.shrc"
fi
