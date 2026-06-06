{
  description = "Gitosk flake for personal use, scrapped together with dozens of hours of tutorials, blood, sweat and tears.";
  
  inputs = {
    
    # System management's urls
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";   
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    # Dendritic pattern's urls

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Extra url's

    nvf.url = "github:NotAShelf/nvf";

  };



  outputs = inputs@{
    flake-parts,
    home-manager,
    nixpkgs,
    nvf,
    ...
  }:

    flake-parts.lib.mkFlake {inherit inputs; }
       # Auto import flake-parts
       (inputs.import-tree ./modules);

}

