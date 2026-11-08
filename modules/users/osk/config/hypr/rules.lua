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
  name = "dont maximize",
  match = { class =".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "Ensure you have a floating window of a set size",
  match = {
    class="clipse", -- not working 
  },
  float = true,
  size = "622 652",
})

hl.window_rule({
  name = "set hardcoded Waydroid sizes",
  match = {
    class = "^(Waydroid|waydroid)"
  },
  pseudo = true,
  size = "500 862",
  max_size = "500 862",
  keep_aspect_ratio = true,
})

hl.window_rule({
  name = "firefox settings",
  match = { class = "^(firefox)" },
  min_size = "720 862",
  no_blur = true,
})

hl.window_rule({match={class="discord"}, no_blur = true})

