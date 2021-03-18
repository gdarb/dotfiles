# https://the.exa.website

# alias `ls` to `exa`
if type -q exa
    function ls
        exa $argv
    end
end
