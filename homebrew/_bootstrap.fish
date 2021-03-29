begin
    check_install brew

    # https://docs.brew.sh/Analytics
    brew analytics off
    and success "disabled analytics"
    or abort "failed to disable analytics"
end
