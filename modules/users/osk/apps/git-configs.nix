{ self, inputs, ... }: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.git = {config, lib, ...}:
{
  programs.git = {
    settings = {
      enable = true;
      userName = "gitosk";
      userEmail = "oscarseiffert@gmail.com";
      init.defaultBranch = "main";
      safe.directory = "~/.dotfiles";
    };
  };

};
}
