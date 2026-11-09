function git_config_success -a key value
    success set (set_color --italics magenta)`git config $key`(set_color normal) to (set_color --italics bryellow)$value(set_color normal)
end

function git_config_skip -a key
    success skipped (set_color --italics magenta)`git config $key`(set_color normal)
end

function git_config_fail -a key
    abort could not set (set_color --italics magenta)`git config $key`(set_color normal)
end

function git_config_set -d "set a git config value"
    argparse a/append -- $argv; or return 1

    if test (count $argv) -ne 2
        echo "usage: git_config_set [-a] KEY VALUE" >&2
        return 1
    end

    set -l key $argv[1]
    set -l value $argv[2]
    set -l opts
    set -q _flag_append; and set -a opts --append

    # if key is not already set to value
    if not git config get --global --fixed-value --value="$value" -- "$key" >/dev/null
        git config set --global $opts -- "$key" "$value"
        and git_config_success $key $value
        or git_config_fail $key; and return 1
    else
        git_config_skip $key
    end
end

function git_config_read -d "prompt and set a git config value"
    if test (count $argv) -ne 1
        echo "usage: git_config_read KEY" >&2
        return 1
    end

    set -l key $argv[1]

    # if key already exists
    if git config get --global -- "$key" >/dev/null
        git_config_skip $key
        return
    end

    user "git config $key"
    read -l -P (set_color --bold blue)'> '(set_color normal) value
    test -n "$value"; or return 1

    git_config_set -- "$key" "$value"; or return 1
end

begin
    check_install git

    # link global ignore
    link_file $SRC/ignore $XDG_CONFIG_HOME/git/ignore $BACKUP/(basename $SRC)

    # adding our configs to global git config using the absolute dotfiles
    # path means we don't have to worry about where the global git config
    # is or the fact that `commit.template` doesn't accept relative paths
    git_config_set --append include.path $DOTFILES/git/config
    git_config_set commit.template $DOTFILES/git/template

    # GitHub CI is non-interactive
    if not_ci
        # prompt for user info
        git_config_read user.name
        git_config_read user.email
        git_config_read user.signingKey
    end

    # add program specific pagers etc
    if type -q nvim
        git_config_set core.editor nvim
    end

    if type -q delta
        git_config_set core.pager "delta --tabs=4"
        git_config_set interactive.diffFilter "delta --color-only"
        git_config_set delta.syntax-theme Nord
        git_config_set delta.navigate true
    end
end
