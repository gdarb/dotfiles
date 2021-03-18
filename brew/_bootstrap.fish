begin
    # https://docs.brew.sh/Analytics
    if type -q brew
        brew analytics off
        and success "disabled analytics"
        or abort "failed to disable analytics"
    end
end
