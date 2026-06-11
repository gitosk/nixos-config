{ inputs, self, ... }: {

  flake.homeModules.defaultApps = { pkgs, ...}: {

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
        "audio/mpeg" = "vlc.desktop";
        "video/mp4"  = "vlc.desktop";
        "video/mpg" = "vlc.desktop";
        "video/mpeg" = "vlc.desktop";
      };
    };
  };
}
