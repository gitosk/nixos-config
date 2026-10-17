{ self, inputs, ...}: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.oskDefault = { pkgs, ... }: {
    
    imports = [     
      self.homeModules.hyprland
      self.homeModules.git     
      self.homeModules.kitty
      self.homeModules.sh
    ];

    home.stateVersion = "25.05";

    home.packages = with pkgs; [
      btop              # Performance metrics
      tor-browser            
      openconnect       # VPN
      waydroid-helper   # GUI for Waydroid
      gnuplot           # Command line plotting
      typst             # Generating PDF from markdown text
      gimp              # Image Editor
      audacity          # Audio Editor 
      mpv               # Video and Audio player for Terminal
      inkscape          # Vectorgraphics
      zotero            # citation software
      xdg-desktop-portal-termfilechooser # Forgot :P 
      kdePackages.kdenlive # Video Editing
      xournalpp         # Notetaking
      pdfarranger       # PDF-Editor
      onlyoffice-desktopeditors         # Ofice-Suite
      anki              # Memorization
#     avogadro2         # Molecule Editor and Visualizer
#     avogadrolibs      # Molecule libraries for Avogadro
      pymol             # Molecule Editor and Visualizer
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
        "audio/mpeg" = "vlc.desktop";
        "video/mp4"  = "vlc.desktop";
        "video/mpg" = "vlc.desktop";
        "video/mpeg" = "vlc.desktop";
      };
    };



  };

}
