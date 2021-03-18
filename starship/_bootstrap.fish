begin
    # link starship.toml
    link_file $SRC/starship.toml $HOME/.config/starship.toml $BACKUP/(basename $SRC)
end
