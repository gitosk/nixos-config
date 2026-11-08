{ self, inputs, ... }: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.gitedu = {config, lib, ...}:
{
  programs.git = {
    settings = {
      enable = true;
      userName = " ";
      userEmail = " ";
      init.defaultBranch = "main";
      safe.directory = "~/.dotfiles";
    };
  };

};
}
