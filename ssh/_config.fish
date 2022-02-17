# https://www.openssh.com

# https://developer.1password.com/docs/ssh
set -l 1password_socket

switch (uname)
    case Darwin
        set 1password_socket "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

    case Linux
        set 1password_socket "$HOME/.1password/agent.sock"
end

if test -S $1password_socket
    set -xg SSH_AUTH_SOCK $1password_socket
end
