# https://github.com/sharkdp/vivid

# use `vivid` to set `LS_COLORS`
if type -q vivid
    set -g LS_COLORS (vivid generate snazzy)
end
