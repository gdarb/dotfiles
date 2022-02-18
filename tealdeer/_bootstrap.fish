begin
    check_install tldr

    set -l config_string "Config path:"
    set -l tealdeer_config (tldr --show-paths | string match -e $config_string | string trim --chars $config_string)

    link_file $SRC/config.toml $tealdeer_config $BACKUP/(basename $SRC)
end
