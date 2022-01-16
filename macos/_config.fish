# https://developer.apple.com/macos/

switch (uname)
    case Darwin
        function resetlaunchpad --description "reset the order of launchpad"
            defaults write com.apple.dock ResetLaunchPad -bool true
            killall Dock
        end

        # add tailscale alias
        set -l tailscale_executable /Applications/Tailscale.app/Contents/MacOS/Tailscale

        if test -x $tailscale_executable
            function tailscale --inherit-variable tailscale_executable
                $tailscale_executable $argv
            end
        end
end
