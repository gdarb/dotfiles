# https://github.com/sharkdp/vivid

# use `vivid` to set `LS_COLORS`
if type -q vivid
    set -gx LS_COLORS (vivid generate snazzy)
end
