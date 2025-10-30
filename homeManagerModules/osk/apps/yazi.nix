{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      keymap = {
        input.prepend_keymap = [
          { run = "shell --orphan --confirm kitty"; on = ["T"] ; desc = "Open terminal at current dir"; }
        ];
        mgr.prepend_keymap = [
          { run = "shell --orphan --confirm kitty"; on = ["T"] ; desc = "Open terminal at current dir"; }
        ];
      };            
    };
  };
}
