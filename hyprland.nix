{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    dunst           # Notification daemon
    libnotify
    hyprpaper
    kitty           # terminal
    wofi	    # Menu
    waybar          # Bar
    hyprsysteminfo
    cliphist        # Clipboard manager
    hyprpolkitagent # Authentication daemon
    hypridle
    hyprutils
    hyprcursor
    hyprpicker      # pick color
    pipewire
    kdePackages.dolphin
  ];

}
