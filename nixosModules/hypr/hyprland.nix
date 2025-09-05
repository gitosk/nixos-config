{pkgs, config, lib, ...}:

{



  options = { # Define toggle option for this module
    hyprland.enable =
      lib.mkEnableOption "enables hyprland" ; # enables hyprland
  };

  config = lib.mkIf config.hyprland.enable {


  programs.hyprland.enable = true; # enable Hyprland


  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "osk";
    defaultSession = "hyprland";
      sddm = {
      enable = true; # enabled in configuration.nix
      wayland.enable = true;
      settings = {
	General.DisplayServer = "wayland";
      };
    };
  };

   environment.systemPackages = with pkgs; [
   matugen
   brightnessctl
   wl-clipboard
   kitty
   ];



    fonts.packages = with pkgs; [
  noto-fonts
  nerd-fonts.symbols-only
  ];

  };  # for the toggle
}
