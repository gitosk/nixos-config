{ self, inputs, ... }: {


  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeModules.kitty = { pkgs, ... }: {

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;          
    };

    themeFile = "Dracula";    

    shellIntegration.enableZshIntegration = true;

    settings = {
    
      wheel_scroll_min_lines = 1;
      window_padding_width = 4;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;
      tab_fade = 1;
      active_tab_font_style = "bold";
      inacZsh_tab_font_style = "bold";
      tab_bar_edge = "top";
      tab_bar_margin_width = 0;
      tab_bar_style = "powerline";
      enabled_layouts = "splits";
    };
    extraConfig = ''

      # Clipboard
      map ctrl+shift+v        paste_from_selection
      map shift+insert        paste_from_selection

      # Scrolling
      map ctrl+shift+up        scroll_line_up
      map ctrl+shift+down      scroll_line_down
      map ctrl+shift+k         scroll_line_up
      map ctrl+shift+j         scroll_line_down
      map ctrl+shift+page_up   scroll_page_up
      map ctrl+shift+page_down scroll_page_down
      map ctrl+shift+home      scroll_home
      map ctrl+shift+end       scroll_end
      map ctrl+shift+h         show_scrollback

      # Window management
      map ctrl+shift+enter    launch --location=hsplit
      map ctrl+shift+s        launch --location=vsplit
      map ctrl+shift+right    next_tab
      map ctrl+shift+left     previous_tab
      map ctrl+shift+t        new_tab
      map ctrl+shift+k        close_tab
      map ctrl+shift+.        move_tab_forward
      map ctrl+shift+,        move_tab_backward

      # Miscellaneous
      map ctrl+shift+up      increase_font_size
      map ctrl+shift+down    decrease_font_size
      map ctrl+shift+backspace restore_font_size

      
    '';
  };
};
}
