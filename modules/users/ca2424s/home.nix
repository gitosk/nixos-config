{ self, inputs, ... }: {
  

  flake.homeConfigurations.ca2324s = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
      modules = [
        # Here you can import different configurations for the same user
        self.homeModules.ca2324sDefault {
          home.username = "ca2324s";
          home.homeDirectory = "/home/ca2324s";
          home.stateVersion = "25.11";
        }

      ];

  };

}
