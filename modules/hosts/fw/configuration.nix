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
    ];

    # Activate flakes feature
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    # Point the home-manager to your users           
    home-manager.users.edu = self.homeModules.eduDefault;

#      PASTE YOUR CONFIGURATION.NIX CONTENTS HERE
    
  };
}
