begin
    set -l VIM_HOME $HOME/.vim

    # link vimrc & gvimrc
    link_file $SRC/vimrc $VIM_HOME/vimrc $BACKUP/(basename $SRC)
    link_file $SRC/gvimrc $VIM_HOME/gvimrc $BACKUP/(basename $SRC)

    # link colors
    link_file $SRC/colors/molokai.vim $VIM_HOME/colors/molokai.vim $BACKUP/(basename $SRC)
end
