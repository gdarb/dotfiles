function change_shell
    user "changing default shell to" (set_color --italics)(which fish)(set_color normal)
    chsh -s (which fish)
    and success "changed default shell to" (set_color --italics)(which fish)(set_color normal)
    or abort "could not change default shell to" (set_color --italics)(which fish)(set_color normal)
end

begin
    # link config.fish
    link_file $SRC/config.fish $XDG_CONFIG_HOME/fish/config.fish $BACKUP/(basename $SRC)

    # add to /etc/shells
    if not grep -q (which fish) /etc/shells
        user adding (set_color --italics)(which fish)(set_color normal) to (set_color --italics)"/etc/shells"(set_color normal)
        which fish | sudo tee -a /etc/shells >/dev/null
        and success added (set_color --italics)(which fish)(set_color normal) to (set_color --italics)"/etc/shells"(set_color normal)
        or abort "could not add" (set_color --italics)(which fish)(set_color normal) to (set_color --italics)"/etc/shells"(set_color normal)
    else
        success "skipped adding" (set_color --italics)(which fish)(set_color normal) to (set_color --italics)"/etc/shells"(set_color normal)
    end

    # set default shell
    switch (uname)
        case Darwin
            # check if fish is already the default shell
            if test (dscl . -read ~/ UserShell | sed 's/UserShell: //') != (which fish)
                change_shell
            else
                success "skipped changing default shell to" (set_color --italics)(which fish)(set_color normal)
            end
        case "*"
            change_shell
    end
end
