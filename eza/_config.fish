# https://github.com/eza-community/eza

# alias `ls` to `eza`
if type -q eza
    function ls --wraps=eza
        eza $argv
    end
end
