{config, lib, ...}:
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
}
