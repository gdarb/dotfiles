# https://github.com/sharkdp/bat

# use `bat` as `MANPAGER`
if type -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end
