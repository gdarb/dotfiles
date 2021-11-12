begin
    check_install fzf

    switch (uname)
        case Darwin
            eval (brew --prefix)/opt/fzf/install --xdg --no-bash --no-zsh --key-bindings --completion --update-rc
            or abort "could not run" (set_color --italics magenta)(brew --prefix)/opt/fzf/install(set_color normal)
    end
end
