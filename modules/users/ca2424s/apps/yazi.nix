{ self, inputs, ... }: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.yazi =
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
                #    settings = {
                #      opener.play =  "'vlc \"$@\"'";  
                #    };
  };
};
}
