function which_fish
    echo -n (set_color --italics magenta)(which fish)(set_color normal)
end

function etc_shells
    echo -n (set_color --italics bryellow)"/etc/shells"(set_color normal)
end

function change_shell
    user "changing default shell to" (which_fish)
    chsh -s (which fish)
    and success "changed default shell to" (which_fish)
    or abort "could not change default shell to" (which_fish)
end

begin
    check_install fish

    # link config.fish
    link_file $SRC/config.fish $XDG_CONFIG_HOME/fish/config.fish $BACKUP/(basename $SRC)

    # GitHub CI doesn't let you change these
    if not_ci
        # add to /etc/shells
        if not grep -q (which fish) /etc/shells
            user adding (which_fish) to (etc_shells)
            which fish | sudo tee -a /etc/shells >/dev/null
            and success added (which_fish) to (etc_shells)
            or abort "could not add" (which_fish) to (etc_shells)
        else
            success "skipped adding" (which_fish) to (etc_shells)
        end

        # set default shell
        switch (uname)
            case Darwin
                # check if fish is already the default shell
                if test (dscl . -read ~/ UserShell | sed 's/UserShell: //') != (which fish)
                    change_shell
                else
                    success "skipped changing default shell to" (which_fish)
                end
            case "*"
                change_shell
        end
    end
end
