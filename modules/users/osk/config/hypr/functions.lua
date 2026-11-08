local function moveWindowsCurrentWorkspace(ws, f)
    local cws = hl.get_active_workspace()
    local windows = hl.get_windows({ workspace = cws })

    for _,w in pairs(windows) do
        hl.dispatch(
            hl.dsp.window.move({
                window = w ,
                workspace = ws ,
                follow = f
            })
        )
    end
end

for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER+SHIFT+ALT+" .. key, function()
        moveWindowsCurrentWorkspace(i, true)
    end)
end

for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER+CTRL+ALT+" .. key, function()
        moveWindowsCurrentWorkspace(i, false)
    end)
end
