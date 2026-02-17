hs.hotkey.bind({ "cmd" }, "`", function()
    local app = hs.application.get("com.googlecode.iterm2")

    if not app then
        hs.application.launchOrFocus("iTerm")
        return
    end

    if app:isFrontmost() then
        app:hide()
        return
    end

    app:activate()
end)
