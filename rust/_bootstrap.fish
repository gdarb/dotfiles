begin
    check_install rustup

    # https://rust-lang.github.io/rustup/installation/index.html#enable-tab-completion-for-bash-fish-zsh-or-powershell
    mkdir -p $XDG_CONFIG_HOME/fish/completions

    rustup completions fish > $XDG_CONFIG_HOME/fish/completions/rustup.fish
    and success "wrote rustup completions"
    or abort "failed to write rustup completions"
end
