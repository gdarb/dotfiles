# https://github.com/sharkdp/vivid

# use `vivid` to set `LS_COLORS`
if type -q vivid
    set -gx LS_COLORS (vivid generate nord2)

    function vivid-themes -d "preview vivid themes in the current directory"
        for theme in (vivid themes)
            echo (set_color --bold)"Theme: $theme"
            set -lx LS_COLORS (vivid generate $theme)
            ls -a
            echo
        end
    end
end
