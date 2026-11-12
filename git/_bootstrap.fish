function git_config_success -a key value
    success "set $(set_color --italics magenta)`git config $key`$(set_color normal) to $(set_color --italics bryellow)$value$(set_color normal)"
end

function git_config_skip -a key
    success "skipped $(set_color --italics magenta)`git config $key`$(set_color normal)"
end

function git_config_fail -a key
    abort "could not set $(set_color --italics magenta)`git config $key`$(set_color normal)"
end

function git_config_set -d "set a git config value"
    argparse --stop-nonopt -N2 -X2 a/append -- $argv
    or begin
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
        or git_config_fail $key
    else
        git_config_skip $key
    end
end

function git_config_read -d "prompt and set a git config value"
    argparse -N1 -X1 -- $argv
    or begin
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
    read -l -P "$(set_color --bold blue)> $(set_color normal)" value
    if test -z "$value"
        info "skipped $(set_color --italics magenta)`git config $key`$(set_color normal) (no value given)"
        return
    end

    git_config_set -- "$key" "$value"
end

begin
    check_install git

    # `git config get/set/unset` require git 2.46 or higher
    set -l git_version (git --version | string match -rg '(\d+)\.(\d+)')
    if test $git_version[1] -lt 2
        or test $git_version[1] -eq 2 -a $git_version[2] -lt 46
        abort "git 2.46 or newer is required (found $git_version[1].$git_version[2])"
    end

    # link config files
    set -l config_loc $XDG_CONFIG_HOME/git/dotfiles
    set -l ignore_loc $XDG_CONFIG_HOME/git/ignore
    set -l template_loc $XDG_CONFIG_HOME/git/template

    link_file $SRC/config $config_loc $BACKUP/(basename $SRC)
    link_file $SRC/ignore $ignore_loc $BACKUP/(basename $SRC)
    link_file $SRC/template $template_loc $BACKUP/(basename $SRC)

    # remove the old relative include
    if git config get --global --fixed-value --value=dotfiles include.path >/dev/null
        git config unset --global --all --fixed-value --value=dotfiles include.path
        and info "removed old relative $(set_color --italics magenta)`include.path`$(set_color normal)"
        or abort "could not remove old relative $(set_color --italics magenta)`include.path`$(set_color normal)"
    end

    git_config_set --append include.path $config_loc
    git_config_set commit.template $template_loc

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
