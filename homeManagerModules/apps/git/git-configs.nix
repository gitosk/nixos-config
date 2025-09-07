{config, lib, ...}:
{
  programs.git = {
    enable = true;
    userName = "gitosk";
    userEmail = "oscarseiffert@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "~/.dotfiles";
    };
  };
}
