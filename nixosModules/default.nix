{config, lib, pkgs, ...}:  # make default imports

{
  imports = [
  ./nvf/nvf.nix
  ./gaming/gaming.nix              
  ];
        #  -------------- CUDA CACHE ------------------

  nix.settings = {  
    substituters = [
      "https://cache.nixos-cuda.org"
    ];
    trusted-public-keys = [
      "cache.nixos-cuda.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E"
    ];
  };

  services.flatpak.enable = true;
  virtualisation.waydroid.enable = true;

    environment.systemPackages = with pkgs; [
      scarlett2
      alsa-scarlett-gui
    ];       
}
