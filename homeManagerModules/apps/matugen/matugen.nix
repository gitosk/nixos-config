{pkgs, config, lib, ...}:
{

# For this to work you need to fill the program as shown
# "relative-path-in-the-nix-store".source = ./templates/program-template


  home.file = {
    ".config/matugen/config.toml".source = ./config.toml;

    ".config/matugen/kitty-colors.conf".source = ./templates/kitty-colors.conf;


  };
}
