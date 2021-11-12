# https://github.com/junegunn/fzf

if type -q fzf
    # use `fd` instead of `find`
    if type -q fd
        set -gx FZF_DEFAULT_COMMAND "fd --type f"
    end

    # https://github.com/junegunn/fzf/blob/master/ADVANCED.md#color-themes
    set -gx FZF_DEFAULT_OPTS "--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1"
end
