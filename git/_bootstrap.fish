function git_config_success -a key value
    success set (set_color --italics magenta)`git config $key`(set_color normal) to (set_color --italics bryellow)$value(set_color normal)
end

function git_config_skip -a key
    success skipped (set_color --italics magenta)`git config $key`(set_color normal)
end

function git_config_fail -a key
    abort could not set (set_color --italics magenta)`git config $key`(set_color normal)
end

function git_config_read -d "prompt for git config if not set" -a file key
    if not test (git config --file $file $key)
        user git config $key
        read -p "echo (set_color --bold blue)\> (set_color normal)" -l value
        git config --file $file $key $value
        and git_config_success $key $value
        or git_config_fail $key
    else
        git_config_skip $key
    end
end

function git_config_test -d "check if git config is set to a value" -a file key value
    if not test (git config --file $file $key)
        or test (git config --file $file $key) != "$value"
        git config --file $file $key $value
        and git_config_success $key $value
        or git_config_fail $key
    else
        git_config_skip $key
    end
end

begin
    check_install git

    # link config files
    link_file $SRC/config $XDG_CONFIG_HOME/git/config $BACKUP/(basename $SRC)
    link_file $SRC/ignore $XDG_CONFIG_HOME/git/ignore $BACKUP/(basename $SRC)
    link_file $SRC/template $XDG_CONFIG_HOME/git/template $BACKUP/(basename $SRC)

    # prompt for info to go into config_local
    set -l git_config_local $XDG_CONFIG_HOME/git/config_local

    # GitHub CI is non-interactive
    if not_ci
        git_config_read $git_config_local user.name
        git_config_read $git_config_local user.email
        git_config_read $git_config_local user.signingKey
    end

    # add program specific pagers etc
    if type -q nvim
        git_config_test $git_config_local core.editor nvim
    end

    if type -q delta
        git_config_test $git_config_local core.pager delta
        git_config_test $git_config_local interactive.diffFilter "delta --color-only"
        git_config_test $git_config_local delta.syntax-theme Nord
    end

    # add template file (as git-config doesn't expand environmental variables)
    set -l commit_template (string replace "$HOME/" "~/" "$XDG_CONFIG_HOME/git/template")
    git_config_test $git_config_local commit.template $commit_template
end
