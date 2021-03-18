begin
    # link init.vim
    link_file $SRC/init.vim $XDG_CONFIG_HOME/nvim/init.vim $BACKUP/(basename $SRC)
end
