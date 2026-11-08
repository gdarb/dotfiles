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

function git_config_append -d "append a git config value" -a key value
    if not git config get --global --value="$value" --fixed-value -- "$key" >/dev/null
        git config set --global --append $key $value
        and git_config_success $key $value
        or git_config_fail $key
    else
        git_config_skip $key
    end
end

begin
    check_install git

    # link global ignore
    link_file $SRC/ignore $XDG_CONFIG_HOME/git/ignore $BACKUP/(basename $SRC)

    # adding our configs to global git config using the absolute dotfiles
    # path means we don't have to worry about where the global git config
    # is or the fact that `commit.template` doesn't accept relative paths
    git_config_append include.path $DOTFILES/git/config
    git_config_test commit.template $DOTFILES/git/template

    # GitHub CI is non-interactive
    if not_ci
        # prompt for user info
        git_config_read user.name
        git_config_read user.email
        git_config_read user.signingKey
    end

    # add program specific pagers etc
    if type -q nvim
        git_config_test core.editor nvim
    end

    if type -q delta
        git_config_test core.pager "delta --tabs=4"
        git_config_test interactive.diffFilter "delta --color-only"
        git_config_test delta.syntax-theme Nord
        git_config_test delta.navigate true
    end
end
