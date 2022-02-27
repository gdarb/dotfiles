begin
    check_install pwsh

    # link profile
    link_file $SRC/Microsoft.Powershell_profile.ps1 $XDG_CONFIG_HOME/powershell/Microsoft.Powershell_profile.ps1 $BACKUP/(basename $SRC)
end
