function change_shell
    chsh -s (which fish)
    and success "changed default shell to fish"
    or abort "could not change default shell to fish"
end

begin
    # link config.fish
    link_file $SRC/config.fish $XDG_CONFIG_HOME/fish/config.fish $BACKUP/(basename $SRC)

    # add to /etc/shells
    if not grep -q (which fish) /etc/shells
        which fish | sudo tee -a /etc/shells >/dev/null
        and success "added fish to /etc/shells"
        or abort "could not add fish to /etc/shells"
    else
        success "skipped adding fish to "(set_color --italics)"/etc/shells"(set_color normal)
    end

    # set default shell
    switch (uname)
        case Darwin
            # check if fish is already the default shell
            if test (dscl . -read ~/ UserShell | sed 's/UserShell: //') != (which fish)
                change_shell
            else
                success "skipped changing default shell to fish"
            end
        case "*"
            change_shell
    end
end
