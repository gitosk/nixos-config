{ self, inputs, ... }: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.ca2324sDefault = { pkgs, ... }: {
    
    imports = [     
      # Here you import your homeModules                   
      self.homeModules.defaultApps
      self.homeModules.hyprland
      self.homeModules.gitedu    
      self.homeModules.kitty
      self.homeModules.sh
    ];

    home.stateVersion = "25.11";

    home.packages = with pkgs; [
      # here you install your home-packages
    ];
  
  };

}
