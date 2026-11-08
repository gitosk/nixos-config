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
