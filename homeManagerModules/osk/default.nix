{config, pkgs, lib, ...}:
{
  imports = [
    ./apps/kitty.nix
    ./apps/sh.nix
    ./apps/git-configs.nix
    ./apps/kitty.nix
    ./apps/office.nix
    ./apps/yazi.nix
  ];

  hyprModule.enable = true; # Enables ../../homeManagerModules/hypr/hyprland.nix 
 
  programs.home-manager.enable=true;

  home.username = "osk";
  home.homeDirectory = "/home/osk";
  home.stateVersion = "25.05";
 
  nixpkgs.config.allowUnfree = true;
 
  home.packages = with pkgs; [
    btop            # Performance metrics
    tor-browser     
    openconnect     # VPN
    waydroid-helper # GUI for Waydroid
    gnuplot         # Command line plotting
    typst           # Generating PDF from markdown text
    gimp
    audacity
  ];

}
