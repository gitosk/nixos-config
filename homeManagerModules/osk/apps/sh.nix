{config, pkgs, ...}:

let                # Creating variables
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    ssh1 = "eval $(ssh-agent)";     # Both of these to reload the ssh key
    ssh2 = "ssh-add ~/.ssh/id_ed25519";
    omen   = "cd ~/.dotfiles/hosts/omen";
    hy = "cd ~/.dotfiles/homeManagerModules/hypr/";
    sy = "cd ~/.dotfiles/nixosModules/hypr/";
    hpc_rwth = "ssh -l ow304070 login23-4.hpc.itc.rwth-aachen.de";
    vpn_rwth = "vpn.rwth-aachen.de";
  };
in

{

  programs.bash = { # enable home-manager to config bash
    enable = true;
    shellAliases = myAliases;
 #  bashrcExtra =
  };

}
