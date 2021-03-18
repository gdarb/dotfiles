# https://github.com/gsamokovarov/jump

# initialise jump
if type -q jump
    status --is-interactive; and source (jump shell fish | psub)
end
