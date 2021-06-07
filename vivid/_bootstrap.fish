begin
    check_install vivid

    # link nord.yml
    link_file $SRC/nord.yml $XDG_CONFIG_HOME/vivid/themes/nord.yml $BACKUP/(basename $SRC)
end
