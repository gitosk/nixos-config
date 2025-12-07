{



  description = "My first flake";
  
  nixConfig = {
    extra-substituters = [
      "https://cuda-maintainers.cachix.org"
  ];
    extra-trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E"
  ];


  };
        
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; # Point to reepositories
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
	./homeManagerModules/osk/default.nix
	];
      };
    }; # What to do with them, the actual system
  };

}

