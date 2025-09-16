{config, lib, pkgs, ...}:  # make default imports

{
  imports = [
  ./nvf/nvf.nix
  ./gaming/gaming.nix              
  ];
  
  services.flatpak.enable = true;
  virtualisation.waydroid.enable = true;
}
