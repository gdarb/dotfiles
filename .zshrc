# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# source zsh-autosuggestions
if [[ -r "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# source powerlevel10k
if [[ -r "$HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
    source "$HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme"
fi

# source shell config
if [[ -r "$HOME/.shrc" ]]; then
    source "$HOME/.shrc"
fi

# To customize prompt, run `p10k configure` or edit ~/.zsh/p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
