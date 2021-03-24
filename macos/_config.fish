# https://developer.apple.com/macos/

switch (uname)
    case Darwin
        function resetlaunchpad --description "reset the order of launchpad"
            defaults write com.apple.dock ResetLaunchPad -bool true
            killall Dock
        end
end
