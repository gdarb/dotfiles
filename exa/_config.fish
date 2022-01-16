# https://the.exa.website

# alias `ls` to `exa`
if type -q exa
    function ls --wraps=exa
        exa $argv
    end
end
