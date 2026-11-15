{ self, inputs, ... }: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.ca2324sDefault = { pkgs, ... }: {
    
    imports = [     
      # Here you import your homeModules                   
      self.homeModules.eduHyprland
      self.homeModules.eduKitty
      self.homeModules.eduYazi
      self.homeModules.eduGit
      self.homeModules.eduSh
    ];

    home.stateVersion = "26.05";

    home.packages = with pkgs; [
      # here you install your home-packages
    ];
  
  };

}
