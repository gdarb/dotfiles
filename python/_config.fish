# https://www.python.org

# pip should only run if there is a virtualenv currently activated
set -xg PIP_REQUIRE_VIRTUALENV true

# use `gpip` to force installation of a package in the global python environment
function gpip --wraps=pip
    set -l PIP_REQUIRE_VIRTUALENV
    pip $argv
end

# alternative `pip3` version
function gpip3 --wraps=pip3
    set -l PIP_REQUIRE_VIRTUALENV
    pip3 $argv
end
