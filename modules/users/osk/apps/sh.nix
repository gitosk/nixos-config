{ self, inputs, ... }: {

  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.sh = {config, pkgs, ...}:

let                # Creating variables
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    "rwth_vpn" = "sudo openconnect vpn.rwth-aachen.de --authgroup 'RWTH-VPN (Full Tunnel)' --user 'ow304070'";
    "rwth_ssh" = "kitten ssh ow304070@login23-1.hpc.itc.rwth-aachen.de ";
    "mount_hpc" = "sshfs ow304070@copy23-1.hpc.itc.rwth-aachen.de:/hpcwork/rwth2258  /home/osk/Documents/UNI/hpc/hpcwork/";
  };
in

{

  programs.bash = { # enable home-manager to config bash
    enable = true;
    shellAliases = myAliases;
 #    initExtra = '' 
 #      function y() {
 #	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
 #	yazi "$@" --cwd-file="$tmp"
 #	IFS= read -r -d \'\' cwd < "$tmp"
 #	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
 #	rm -f -- "$tmp"
 #   '';
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

};
}
