# https://github.com/sharkdp/bat

if type -q bat
    # alias `cat` to `bat`
    function cat --wraps=bat
        bat $argv
    end

    # use `bat` as `MANPAGER`
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end
