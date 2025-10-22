{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        settings = {
          "browser.startup.homepage" = "https://your-homepage.com";
          "browser.window.minWidth" = 900;  # Set minimum width
#         "browser.window.minHeight" = 600;  # Set minimum height
        };
      };
    };
  };
}

