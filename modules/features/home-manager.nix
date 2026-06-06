{ self, inputs, ... }: {

  # This is your module that imports and configures home-manager
  flake.nixosModules.myHomeManager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default # import official home-manager NixOS module
    ];

    home-manager = {
      # Here come general HM settings
      useGlobalPkgs = true;             # Syncronizes versions
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
}
