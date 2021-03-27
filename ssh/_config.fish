# https://www.openssh.com

set -l ssh_key $HOME/.ssh/id_rsa

# add ssh key to ssh-agent using the built-in macOS ssh tool
# to allow storing of the keyphrase in the macOS Keychain
if test (uname) = Darwin
    and test -e $ssh_key
    /usr/bin/ssh-add -qK $ssh_key
end
