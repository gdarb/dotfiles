begin
    check_install vim

    set -l vim_home $HOME/.vim

    # link vimrc & gvimrc
    link_file $SRC/vimrc $vim_home/vimrc $BACKUP/(basename $SRC)
    link_file $SRC/gvimrc $vim_home/gvimrc $BACKUP/(basename $SRC)

    # link colors
    link_file $SRC/colors/molokai.vim $vim_home/colors/molokai.vim $BACKUP/(basename $SRC)

    # create `.vim/tmp` directory
    mkdir -p $vim_home/tmp
end
