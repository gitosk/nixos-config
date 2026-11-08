{ inputs, self, ...}: {

  flake.homeModules.hyprlock = { pkgs, ...}: {

    programs.hyprlock = {
      enable = true;
      settings = {
        background = {
          color ="rgb(10, 10, 10)";
          blur_passes = 2;
        };
        input-field = {
  
          size ="20%, 5%";
          outline_thickness = 3;
          inner_color ="rgb(139,213,202)"; # no fill
          position ="0, -20";
          halign ="center";
          valign ="center";         
        };      
      };
    };
  };
}
