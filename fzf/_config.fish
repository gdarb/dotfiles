# https://github.com/junegunn/fzf

if type -q fzf
    # use `fd` instead of `find`
    if type -q fd
        set -gx FZF_DEFAULT_COMMAND "fd --type f"
    end
end
