function git_config -d "prompt for git config if not set" -a file key
    if not test (git config --file $file $key)
        user git config $key
        git config --file $file $key (read)
    else
        success "skipped "(set_color --italics)"`git config $key`"(set_color normal)
    end
end

begin
    # link config files
    link_file $SRC/config $XDG_CONFIG_HOME/git/config $BACKUP/(basename $SRC)
    link_file $SRC/ignore $XDG_CONFIG_HOME/git/ignore $BACKUP/(basename $SRC)


    # prompt for info to go into config_local
    set -l git_config_local $XDG_CONFIG_HOME/git/config_local

    git_config $git_config_local user.name
    git_config $git_config_local user.email
    git_config $git_config_local user.signingKey


    # add program specific pagers etc
    if type -q nvim
        git config --file $git_config_local core.editor nvim
    end

    if type -q delta
        git config --file $git_config_local core.pager delta
    end
end
