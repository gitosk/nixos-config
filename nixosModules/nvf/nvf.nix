{
  programs.vim.defaultEditor = true;

  programs.nvf = {
    enable = true;
    settings = {
      vim = {

        theme = {
          enable = true;
          name = "dracula";
          style = "dark";        
        };


        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        lsp.enable = true;

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          python.enable = true;      
        };

      };
    };
  };
}
