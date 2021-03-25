begin
    # link zshrc
    link_file $SRC/zshrc $HOME/.zshrc $BACKUP/(basename $SRC/)

    # create ~/.zsh directory
    mkdir -p $HOME/.zsh
end
