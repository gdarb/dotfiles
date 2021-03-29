begin
    check_install ssh

    # link config
    link_file $SRC/config $HOME/.ssh/config $BACKUP/(basename $SRC)
end
