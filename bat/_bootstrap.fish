begin
    check_install bat

    # link config
    link_file $SRC/config (bat --config-file) $BACKUP/(basename $SRC)
end
