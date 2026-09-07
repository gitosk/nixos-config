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
      self.homeModules.defaultApps
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
  
  };

}
