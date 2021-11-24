# https://github.com/gsamokovarov/jump

if type -q jump
    # set $JUMP_HOME
    not set -q XDG_CONFIG_HOME && set -gx JUMP_HOME $HOME/.config/jump

    # initialise jump
    status --is-interactive; and source (jump shell fish | psub)
end
