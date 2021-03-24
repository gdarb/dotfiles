# https://github.com/BurntSushi/ripgrep

# alias `grep` to `rg`
if type -q rg
    function grep
        rg $argv
    end
end
