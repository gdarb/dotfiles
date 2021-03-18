# https://github.com/sharkdp/bat

# use `bat` as `MANPAGER`
if type -q bat
    set -g MANPAGER sh -c 'col -bx | bat -l man -p'
end
