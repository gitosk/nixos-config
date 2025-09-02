{



  description = "My first flake - Private Profile";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; # Point to reepositories
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Syncronize versions

    # matugen.url = "github:Iniox/Matugen"; # For colors based on Wallpaper
  }; 

  outputs = inputs@{nixpkgs, home-manager, ...}:  # This 3 expressions to pass lib into nixpkgs
    let                                  
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {      # System configurations
      nixos = lib.nixosSystem {  # "nixos is the Hostname"
        inherit system;
	modules = [ ./system/configuration.nix ];            # List of modules.nix files
      };
    };
    homeConfigurations = {       # user configurations
      osk = home-manager.lib.homeManagerConfiguration { # "osk is the Hostname"
	inherit pkgs;
	modules = [ ./profiles/private/home.nix ];            # List of modules.nix files
      };
    }; # What to do with them, the actual system
  };

}

