{pkgs, ...}:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
    vulkan-tools
    heroic            
    (retroarch.withCores (cores: with cores;[
     citra
     desmume
     dolphin
     melonds

     ]))

                #    (lutris.override {
                #      extraLibraries = pkgs:[];
                #      extraPkgs = pkgs:[ 
                #        adwaita-icon-theme
                #      ];
                #    })
  ];  
  
  
        
  # Inperative instalation from Proton run protonup

  environment.sessionVariables = {
  STEAM_EXTRA_COMPAT_TOOLS_PATHS = "home/osk/.steam/root/compatibilitytools.d";
                #  __GLX_VENDOR_LIBRARY_NAME="nvidia";
                #  __VK_LAYER_NV_optimus="NVIDIA_only";
                
  };
                
}
