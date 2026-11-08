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
