# https://github.com/BurntSushi/ripgrep

# alias `grep` to `rg`
if type -q rg
    function grep --wraps=rg
        rg $argv
    end
end
