{ self, inputs, ... }: {
  

  flake.homeConfigurations.osk = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
      modules = [
        # Different configurations for the same user
        self.homeModules.oskDefault {
          home.username = "osk";
          home.homeDirectory = "/home/osk";
          home.stateVersion = "25.05";
        }

      ];

  };

}
