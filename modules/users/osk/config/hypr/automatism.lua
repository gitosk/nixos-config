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
