{ inputs, self, ... }: {
        
  flake.nixosModules.noctalia ={ pkgs, config, ...}: {

    imports = [
      inputs.noctalia.nixosModules.default
    ];

  # Enable binary caching to avoid builds. Can be removed once Noctalia v5 is in nixpkgs
    nix.settings = {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };

    programs.noctalia = {
      enable = true;
    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
      recommendedServices.enable = true;
    };

  };

}
