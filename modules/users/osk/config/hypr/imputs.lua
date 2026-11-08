-- inputs
hl.config({
  input = {
    kb_layout = "de",
    repeat_delay = 200,
    repeat_rate = 35,
    sensitivity = 0,
    follow_mouse = true,
    tablet = {
    left_handed = true,
    output = "current"
    },
    touchpad = {
    natural_scroll = true,
    }
  }
})

-- Core binds
local ipc = "noctalia msg "

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind("SUPER + C", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind("SUPER + comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind("SUPER + N" , hl.dsp.exec_cmd(ipc .. "panel-toggle noctalia/notes:panel"))
-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))


-- settings.bind
hl.bind("SUPER + F", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("kitty yazi"))
hl.bind("SUPER + K", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + K", hl.dsp.window.kill())
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + SHIFT + L", hl.dsp.exit())
hl.bind("SUPER + W",  hl.dsp.window.float())
-- hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + A", hl.dsp.window.pseudo())
hl.bind("SUPER + S", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + left", hl.dsp.focus({direction = "left"}))
hl.bind("SUPER + right", hl.dsp.focus({direction = "right"}))
hl.bind("SUPER + up", hl.dsp.focus({direction ="up"}))
hl.bind("SUPER + down" , hl.dsp.focus({direction = "down"}))
hl.bind("SUPER + Print" , hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("kitty --class clipse -e 'clipse'"))
hl.bind("SUPER + SHIFT + M", hl.dsp.window.move({ workspace = "special:magic" })) 
hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("magic"))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))

-- shifting workspaces

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- switches

--hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("hyprlock"))
hl.bind("switch:on:Lid Switch",
    function()
      hl.dispatch(hl.monitor({
        output = "eDP-1",
        disabled = true })
      )
    end , {locked = true}
)

hl.bind("switch:off:Lid Switch",
    function()
      hl.dispatch(hl.monitor({
        disabled = false,
        output = "eDP-1",
        mode = "1920x1080",
        position = "1600x900",
        scale = 2,
      }))
     end, {locked = true}
)


-- mouse binds 
hl.config({
    binds = {
        drag_threshold = 5 -- Fire a drag event only after dragging for more than 5px
    }
})
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })    -- SUPER + LMB: Move a window
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })  -- SUPER + RMB: Resize a window

-- multimedia binds, the {locked = true} lets the bind execute in locked screen

--      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {locked = true})
--      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {locked = true})
--      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked = true})
--      hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {locked = true})
--      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {locked = true})
--      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {locked = true})

