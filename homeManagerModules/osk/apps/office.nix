{pkgs, config, ...}:
{
  home.packages = with pkgs; [
  
    xournalpp
    pdfarranger
    onlyoffice-desktopeditors
    anki
                
  ];
}
