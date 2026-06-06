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
          hyprpanel                # Panel Bar
          rofi		           # Execute programs
          hyprshot                 # screenshots
          clipse	           # clipboard manager
          ags                      # dunst "replacement" needed for hyprpanel
          pipewire            	   # App Comunication
          hyprpolkitagent     	   # Notifications
          qadwaitadecorations      # qt 5 and 6
          wireplumber              # For App-Comunication
          hyprpicker               # Pick color
          cliphist                 # Clipboard manager
          clipse	           # GUI for clipboard
          yazi                     # File manager, best app ever.
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
