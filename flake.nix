{



  description = "My first flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Point to reepositories
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Syncronize versions
    nvf.url = "github:NotAShelf/nvf";
    
    }; 

  outputs = {nixpkgs, home-manager, nvf, ...}@inputs:  # This 3 expressions to pass lib into nixpkgs
    let                                  
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {


    nixosConfigurations = {              # System configurations
      omen = lib.nixosSystem {           # "omen is the Hostname/pc-name"
        inherit system;
	modules = [                          # List of modules.nix files
	  ./hosts/omen/configuration.nix
	  ./nixosModules/default.nix
          nvf.nixosModules.default
          home-manager.nixosModules.home-manager
	];
      };
    };


    homeConfigurations = {               # user configurations
      osk = home-manager.lib.homeManagerConfiguration { # "osk is the Username"
	inherit pkgs;
	modules = [                          # List of modules.nix files
	./hosts/omen/home.nix
	./homeManagerModules/default.nix
	];
      };
    }; # What to do with them, the actual system
  };

}

