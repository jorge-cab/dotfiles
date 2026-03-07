hs.hotkey.bind({ "cmd" }, "`", function()
    print "triggered terminal shortcut"
    local app = hs.application.get("com.googlecode.iterm2")

    if not app then
        print "App not found, Launching..."
        hs.application.launchOrFocus("iTerm")
        return
    end

    if app:isFrontmost() then
        print "Hiding iTerm..."
        app:hide()
        return
    else
        print "iTerm is not focused"
    end

    app:activate()
end)
