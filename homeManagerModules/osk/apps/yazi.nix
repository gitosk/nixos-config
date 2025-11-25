{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      opener.play =  "'vlc \"$@\"'";  
    };
  };
}
