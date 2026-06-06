{ self, inputs, ... }: { 

  flake.homeModules.hyprland = {pkgs, config, ... }: {
#    imports = [
#      self.homeModules.hyprlock
#    ];   
    
    wayland.windowManager.hyprland.systemd.enable = false;

    home.file.".config/hypr" = { 
      source =  ../config/hypr;
      recursive = true;
      force = true;
    };
    home.file.".config/hyprpanel" = { 
      source =  ../config/hyprpanel;
      recursive = true;
      force = true;
    };

  };              
}
