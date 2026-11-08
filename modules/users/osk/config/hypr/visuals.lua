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
