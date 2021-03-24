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
    set -l GIT_CONFIG_LOCAL $XDG_CONFIG_HOME/git/config_local

    git_config $GIT_CONFIG_LOCAL user.name
    git_config $GIT_CONFIG_LOCAL user.email
    git_config $GIT_CONFIG_LOCAL user.signingKey


    # add program specific pagers etc
    if type -q nvim
        git config --file $GIT_CONFIG_LOCAL core.editor nvim
    end

    if type -q delta
        git config --file $GIT_CONFIG_LOCAL core.pager delta
    end
end
