-- my rewritten config with lua.

-- autostart
hl.on("hyprland.start", function ()
  hl.exec_cmd("dbus-update-activation-environment --systemd --all") -- ALLWAYS FIRST
  hl.exec_cmd("noctalia")
hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

-- environment variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRSHOT_DIR", "~/Pictures/Screenshots")


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

-- settings.monitor
hl.config({ xwayland = { force_zero_scaling = true } })
hl.monitor({
  output = "desc:ViewSonic Corporation VX3211-2K V3G191100694",
  mode = "2560x1440",
  position = "0x0",
  scale = 1.6,
})

hl.monitor({
  output = "eDP-1",
  mode = "1920x1080",
  position = "1600x900",
  scale = 1.5,
})


hl.monitor({
  output = "desc:FMX Xiaomi L1 0x00000001",
  mode = "1920x1080",
  position = "-320x-180",
  scale = 1
})


hl.monitor({
  output = " ",
  mode = "preferred",
  position = "auto-center-left",
  scale = 1
})

-- testing noctalia

local ipc = "noctalia msg "

-- Core binds
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

-- AESTETICS

hl.config({
  general = {
    allow_tearing = false;
    gaps_in = 2,
    gaps_out = 5,
    border_size = 1,
    col = {
      active_border = {
        colors = { "rgb(198,160,246)", "rgb(139,213,202)" },
      inactive_border = "rgba(595959aa)",
      },
    },
  },

  decoration = {
    rounding = 7,
    rounding_power = 3,
    inactive_opacity = 0.95,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },

  dwindle = {
    smart_split = true,
    preserve_split = true,
  },
  cursor = {
    inactive_timeout = 1.5,
--  no_hardware_cursors = true, -- should fix flickering
    default_monitor = "HDMI-A-1"
  },
})

-- curve definitions with names
hl.curve("easeOutQuint",
  { type= "bezier",
    points = { {0.23, 1}, {0.32, 1} }
  }
)

hl.curve("easeInOutCubic",
  { type = "bezier",
    points = { {0.65, 0.05}, {0.36, 1} }
  }
)
hl.curve("linear",
  { type = "bezier",
    points = { { 0, 0 }, { 1, 1 } }
  }
)
hl.curve("almostLinear",
  { type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1 } }
  }
)
hl.curve("quick",
  { type = "bezier",
    points = { {0.15, 0}, {0.1, 1} }
  }
)

-- animations 
-- for changes please read again https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint" , style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })


-- layer rules

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})


-- window rules

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.window_rule({
  name = "dont maximize",
  match = { class =".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "Ensure you have a floating window of a set size",
  match = {
    class="clipse",
  },
  float = true,
  size = "622 652",
})

hl.window_rule({
  name = "set hardcoded Waydroid sizes",
  match = {
    initial_class = "Waydroid"
  },
  pseudo = true,  -- floats for some reason
  size = "500 862",
})

hl.window_rule({
  name = "set hardcoded Amazon-Music sizes",
  match = {
    initial_class = "waydroid.com.amazon.mp3"
  },
  pseudo = true,  -- floats for some reason
  size = "500 862",
})

hl.window_rule({
  name = "set hardcoded Authenticator sizes",
  match = {
    initial_class = "waydroid.com.google.android.apps.authenticator2"
  },
  pseudo = true,  -- floats for some reason
  size = "500 862",
})

hl.window_rule({
  name = "firefox settings", -- bc weird in small sizes
  match = { initial_class = "^(firefox)" },
--min_size = "720 862",
  opaque = true,
})

hl.window_rule({match={class="discord"}, opaque = true})



