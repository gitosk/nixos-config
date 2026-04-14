{config, lib, pkgs, ...}:  # make default imports

{
  imports = [
  ./nvf/nvf.nix
  ./gaming/gaming.nix              
  ];

        # ---------------- Nice to have ---------------
 
  services.flatpak.enable = true;  # For flatpak aplications
  virtualisation.waydroid.enable = true; # Android Apps, not working currently


}
