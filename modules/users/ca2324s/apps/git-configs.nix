{ self, inputs, ... }: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.eduGit = {config, lib, ...}:
{
  programs.git = {
    settings = {
      enable = true;
      userName = "c-eduardo2001";
      userEmail = "calvaradoarriaga@gmail.com";
      init.defaultBranch = "main";
      safe.directory = "~/.dotfiles";
    };
  };

};
}
