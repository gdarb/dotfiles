begin
    # link config.fish
    link_file $SRC/config.fish $XDG_CONFIG_HOME/fish/config.fish $BACKUP/(basename $SRC)
end
