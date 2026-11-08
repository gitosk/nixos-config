{ self, inputs, ... }: {

  flake.nixosConfigurations.fw = inputs.nixpkgs.lib.nixosSystem {
    modules = [   
    # import system-level modules       
    self.nixosModules.fwModule
    self.nixosModules.myHomeManager

    ];

  };


  flake.nixosModules.fwModule = { pkgs, ...}: {
    # Do the configuration in a module named HOSTModule
    
    imports = [
#     self.nixosModules.YOURMODULES                  
#     IMPORT YOUR HARDWARE CONFIGURATION HERE ALSO
      self.nixosModules.fwHardware
      self.nixosModules.hyprland
      self.nixosModules.gaming
      self.nixosModules.nvf
      self.nixosModules.noctalia
    ];

    # Activate flakes feature
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    # Point the home-manager to your users           
    home-manager.users.ca2324s= self.homeModules.ca2324sDefault;

#      PASTE YOUR CONFIGURATION.NIX CONTENTS HERE
    
  };
}
