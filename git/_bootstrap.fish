function git_config_success -a key value
    success set (set_color --italics magenta)`git config $key`(set_color normal) to (set_color --italics bryellow)$value(set_color normal)
end

function git_config_skip -a key
    success skipped (set_color --italics magenta)`git config $key`(set_color normal)
end

function git_config_fail -a key
    abort could not set (set_color --italics magenta)`git config $key`(set_color normal)
end

function git_config_read -d "prompt for git config if not set" -a key
    if not test (git config --global $key)
        user git config $key
        read -p "echo (set_color --bold blue)\> (set_color normal)" -l value
        git config --global $key $value
        and git_config_success $key $value
        or git_config_fail $key
    else
        git_config_skip $key
    end
end

function git_config_test -d "check if git config is set to a value" -a key value
    if not test (git config --global $key) || test (git config --global $key) != "$value"
        git config --global $key $value
        and git_config_success $key $value
        or git_config_fail $key
    else
        git_config_skip $key
    end
end

begin
    check_install git

    # link config files
    link_file $SRC/config $XDG_CONFIG_HOME/git/dotfiles $BACKUP/(basename $SRC)
    link_file $SRC/ignore $XDG_CONFIG_HOME/git/ignore $BACKUP/(basename $SRC)
    link_file $SRC/template $XDG_CONFIG_HOME/git/template $BACKUP/(basename $SRC)

    # add our config file to git config
    git_config_test include.path dotfiles

    # add template file (as git-config doesn't expand environmental variables)
    set -l commit_template (string replace "$HOME/" "~/" "$XDG_CONFIG_HOME/git/template")
    git_config_test commit.template $commit_template

    # GitHub CI is non-interactive
    if not_ci
        # prompt for user info
        git_config_read $git_config_local user.name
        git_config_read $git_config_local user.email
        git_config_read $git_config_local user.signingKey
    end

    # add program specific pagers etc
    if type -q nvim
        git_config_test core.editor nvim
    end

    if type -q delta
        git_config_test core.pager delta
        git_config_test interactive.diffFilter "delta --color-only"
        git_config_test delta.syntax-theme Nord
    end
end
