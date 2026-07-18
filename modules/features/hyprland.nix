{ self, inputs, ... }: {

  flake.nixosModules.hyprland = { pkgs, lib, ... }: {

    programs.hyprland.enable = true; # Enable system-level hyprland



# ------------------------- Packages ---------------------------------

        environment.systemPackages = with pkgs; [
          matugen                  # Possibly unnecesary
          brightnessctl            
          wl-clipboard
          kitty                    # Necesary terminal Emulator
          kitty-themes
          pipewire            	   # App Comunication
          hyprpolkitagent     	   # Notifications
          qadwaitadecorations      # qt 5 and 6
          wireplumber              # For App-Comunication
          kdePackages.dolphin      # Fallback file explorer
          iwgtk                    # Wifi settings
          blueman                  # Bluetooth settings
          hyprshot                 # For Screenshots

        ];





# -------------------- System startup Settings --------------------


    services = {
      displayManager = {
        defaultSession = "hyprland";
        sddm = {
          enable = true; 
          wayland.enable = true;                                    
          settings = {
            General.DisplayServer = "wayland";
          };
        };
      };  
    };       

        

  };
}
