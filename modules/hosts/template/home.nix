{ self, inputs, ... }: {
  

# flake.homeConfigurations.USER = inputs.home-manager.lib.homeManagerConfiguration {
#   pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
#     modules = [
#       # Different configurations for the same user
#       self.homeModules.USERDefault {
#         home.username = "USER";
#         home.homeDirectory = "/home/USER";
#         home.stateVersion = "25.11";
#       }

#     ];

# };

}
