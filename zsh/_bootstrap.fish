begin
    check_install zsh

    # link zshrc
    link_file $SRC/zshrc $HOME/.zshrc $BACKUP/(basename $SRC)

    # create zsh directory
    mkdir -p $XDG_CONFIG_HOME/zsh
end
