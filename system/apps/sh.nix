{config, pkgs, ...}:

let                # Creating variables
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    ssh1 = "eval $(ssh-agent)";     # Both of these to reload the ssh key
    ssh2 = "ssh-add ~/.ssh/id_ed25519";
    ph   = "cd ~/.dotfiles/profiles/private/";
    co = "cd ~/.dotfiles/";
    
  };
in

{

  programs.bash = { # enable home-manager to config bash
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = { # enable home-manager to config zsh
    enable = true;
    shellAliases = myAliases;
  };


}
