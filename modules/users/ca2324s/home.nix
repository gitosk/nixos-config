{ self, inputs, ... }: {
  

  flake.homeConfigurations.ca2324s = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
      modules = [
        # Here you can import different configurations for the same user
        self.homeModules.ca2324sDefault {
          home.username = "ca2324s";
          home.homeDirectory = "/home/ca2324s";
          home.stateVersion = "26.05";
          home.backupFileExtension = "backup";
        }

      ];

#####################  Default Apps ######################


    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "application/pdf" = "org.kde.okular.desktop";
        "text/plain" = "org.kde.kate.desktop";
        "image/png"  = "org.kde.gwenview.desktop";
        "image/jpeg"  = "org.kde.gwenview.desktop";
        "image/svg"  = "org.kde.gwenview.desktop";
        "audio/mpeg" = "vlc.desktop";
        "video/mp4"  = "vlc.desktop";
        "video/mpg" = "vlc.desktop";
        "video/mpeg" = "vlc.desktop";
      };
    };



  };

}
