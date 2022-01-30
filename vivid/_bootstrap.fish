begin
    check_install vivid

    # link nord2.yml
    link_file $SRC/nord2.yml $XDG_CONFIG_HOME/vivid/themes/nord2.yml $BACKUP/(basename $SRC)
end
