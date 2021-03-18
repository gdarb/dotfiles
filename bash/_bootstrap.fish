begin
    # link bashrc & bash_profile
    link_file $SRC/bashrc $HOME/.bashrc $BACKUP/(basename $SRC/)
    link_file $SRC/bash_profile $HOME/.bash_profile $BACKUP/(basename $SRC/)
end
