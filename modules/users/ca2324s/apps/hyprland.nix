{ self, inputs, ... }: { 

  flake.homeModules.eduHyprland = { self, pkgs, config, ... }: {
#    imports = [
#      self.homeModules.hyprlock
#    ];   
    
    wayland.windowManager.hyprland.systemd.enable = false;

    home.file.".config/hypr" = { 
      source =  ../config/hypr;
      recursive = true;
      force = true;
    };

  };              
}
