# ~~ bash config ~~

# brew bash completion
if type brew &>/dev/null; then
HOMEBREW_PREFIX=$(brew --prefix)
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# source shell config
if [[ -r "$HOME/.shrc" ]]; then
    source "$HOME/.shrc"
fi
