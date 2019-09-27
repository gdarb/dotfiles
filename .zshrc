# ~~ zsh config ~~

# add `z` command
if [[ -r "$HOME/.zsh/zsh-z/zsh-z.plugin.zsh" ]]; then
    source "$HOME/.zsh/zsh-z/zsh-z.plugin.zsh"
fi
export ZSHZ_DATA="$HOME/.zsh/.z"
zstyle ':completion:*' menu select

HISTFILE="$HOME/.zsh/.histfile"
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit -d "$HOME/.zsh/.zcompdump"

# make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

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

# check if pure prompt exists
if [[ -d "$HOME/.zsh/pure" ]]; then
    # add pure to `fpath` for `async` and `pure_prompt_setup` symlinks
    fpath+=("$HOME/.zsh/pure")
    autoload -U promptinit; promptinit
    prompt pure
fi

# source shell config
if [[ -r "$HOME/.shrc" ]]; then
    source "$HOME/.shrc"
fi
