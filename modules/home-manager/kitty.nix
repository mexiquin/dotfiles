{ inputs, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # Font Configuration
      font_family = "FiraCode Nerd Font";
      font_size = "12.0";
      disable_ligatures = "never"; # Enable ligatures for Fira Code

      # Window Configuration
      background_opacity = "0.9";
      window_padding_width = 10;
      dynamic_background_opacity = "no";

      # Cursor Configuration
      cursor_shape = "underline";
      cursor_underline_thickness = "0.15";
      cursor_blink_interval = "0.5"; # Enable cursor blinking
      cursor_stop_blinking_after = "15.0";

      # Scrollback
      scrollback_lines = 10000;
      scrollback_pager_history_size = 10; # MB
      wheel_scroll_multiplier = "3.0";

      # Mouse
      mouse_hide_wait = "3.0"; # Hide when typing
      copy_on_select = "yes"; # Save selection to clipboard

      # Terminal Configuration
      term = "xterm-256color";

      # Shell Integration (requested feature)
      shell_integration = "enabled";

      # Tab Bar Configuration (requested feature)
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";
    };

    # Keyboard Shortcuts
    keybindings = {
      # Tab Management (NEW - requested feature)
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+tab" = "next_tab";
      "ctrl+shift+tab" = "previous_tab";
      "ctrl+shift+right" = "move_tab_forward";
      "ctrl+shift+left" = "move_tab_backward";

      # Scrolling (preserving Alacritty bindings)
      "shift+page_up" = "scroll_page_up";
      "shift+page_down" = "scroll_page_down";
      "shift+home" = "scroll_home";
      "shift+end" = "scroll_end";

      # Copy/Paste (preserving Alacritty bindings)
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";

      # Search (preserving Alacritty bindings)
      "ctrl+shift+f" = "show_scrollback"; # Opens scrollback in pager with search

      # Font Size Controls (preserving Alacritty bindings)
      "ctrl+0" = "change_font_size all 0"; # Reset
      "ctrl+plus" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+equal" = "change_font_size all +1.0"; # Alternative for +

      # Window Management
      "ctrl+shift+enter" = "new_window";

      # Clear screen is handled natively by shell (Ctrl+L works by default)
    };

    # Theme Configuration
    extraConfig = ''
      # Import Noctalia theme from config directory
      include themes/noctalia.conf

      # Semantic escape characters for selection (from Alacritty)
      select_by_word_characters @-./_~?&=%+#
    '';
  };
}
