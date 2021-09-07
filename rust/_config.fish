# https://www.rust-lang.org

if set -q CARGO_HOME
    # if CARGO_HOME is set, use that in PATH
    fish_add_path --global $CARGO_HOME/bin
else
    # otherwise use the default location
    fish_add_path --global $HOME/.cargo/bin
end
