#{ self, inputs, ... }: {

#  flake.nixosConfigurations.HOST = inputs.nixpkgs.lib.nixosSystem {
#    modules = [   
#    # import system-level modules       
#    self.nixosModules.HOSTModule
#    self.nixosModules.myHomeManager

#    ];

#  };


#  flake.nixosModules.HOSTModule = { pkgs, ...}: {
#    # Do the configuration in a module named HOSTModule
#    
#    imports = [
#      self.nixosModules.YOURMODULES                  
#      IMPORT YOUR HARDWARE CONFIGURATION HERE ALSO
#    ];

#    # Activate flakes feature
#    nix.settings.experimental-features = [ "nix-command" "flakes" ];
#    
#    # Point the home-manager to your users           
#    home-manager.users.USER = self.homeModules.USERDefault;

#    PASTE YOUR CONFIGURATION.NIX CONTENTS HERE
#    
#  };
#}
