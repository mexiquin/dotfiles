{ config, pkgs, inputs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  opacity = "0.8";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;

  home.username = "quinton";
  home.homeDirectory = "/home/quinton";

  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
    ".config/nixpkgs/config.nix".text = "{allowUnfree = true;}";
  };

  programs.home-manager.enable = true;

  programs.go = {
    enable = true;

  };

  # Create and manage standard home folders (Desktop, Downloads, Pictures, etc.)
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        nord0 = mkLiteral "#${config.colorScheme.palette.base00}";
        nord1 = mkLiteral "#${config.colorscheme.palette.base01}";
        nord2 = mkLiteral "#${config.colorscheme.palette.base02}";
        nord3 = mkLiteral "#${config.colorscheme.palette.base03}";
        nord4 = mkLiteral "#${config.colorscheme.palette.base04}";
        nord5 = mkLiteral "#${config.colorscheme.palette.base05}";
        nord6 = mkLiteral "#${config.colorscheme.palette.base06}";
        nord7 = mkLiteral "#${config.colorscheme.palette.base07}";
        nord8 = mkLiteral "#${config.colorscheme.palette.base08}";
        nord9 = mkLiteral "#${config.colorscheme.palette.base09}";
        nord10 = mkLiteral "#${config.colorscheme.palette.base0A}";
        nord11 = mkLiteral "#${config.colorscheme.palette.base0B}";
        nord12 = mkLiteral "#${config.colorscheme.palette.base0C}";
        nord13 = mkLiteral "#${config.colorscheme.palette.base0D}";
        nord14 = mkLiteral "#${config.colorscheme.palette.base0E}";
        nord15 = mkLiteral "#${config.colorscheme.palette.base0F}";

        spacing = 2;

        background-color = mkLiteral "var(nord1)";

        background = mkLiteral "var(nord1)";
        foreground = mkLiteral "var(nord6)";

        normal-background = mkLiteral "var(background)";
        normal-foreground = mkLiteral "var(foreground)";
        alternate-normal-background = mkLiteral "var(background)";
        alternate-normal-foreground = mkLiteral "var(foreground)";
        selected-normal-background = mkLiteral "var(nord13)";
        selected-normal-foreground = mkLiteral "var(background)";

        active-background = mkLiteral "var(background)";
        active-foreground = mkLiteral "var(nord10)";
        alternate-active-background = mkLiteral "var(background)";
        alternate-active-foreground = mkLiteral "var(nord10)";
        selected-active-background = mkLiteral "var(nord10)";
        selected-active-foreground = mkLiteral "var(background)";

        urgent-background = mkLiteral "var(background)";
        urgent-foreground = mkLiteral "var(nord8)";
        alternate-urgent-background = mkLiteral "var(background)";
        alternate-urgent-foreground = mkLiteral "var(nord8)";
        selected-urgent-background = mkLiteral "var(nord8)";
        selected-urgent-foreground = mkLiteral "var(background)";
      };

      "element" = {
          padding = mkLiteral "0px 0px 0px 7px";
          spacing = mkLiteral "5px";
          border =  0;
          cursor =  mkLiteral "pointer";
      };

      "element normal.normal" = {
          background-color = mkLiteral "var(normal-background)";
          text-color = mkLiteral "var(normal-foreground)";
      };

      "element normal.urgent" = {
          background-color = mkLiteral "var(urgent-background)";
          text-color = mkLiteral "var(urgent-foreground)";
      };

      "element normal.active" = {
          background-color = mkLiteral "var(active-background)";
          text-color = mkLiteral "var(active-foreground)";
      };

      "element selected.normal" = {
          background-color = mkLiteral "var(selected-normal-background)";
          text-color = mkLiteral "var(selected-normal-foreground)";
      };

      "element selected.urgent" = {
          background-color = mkLiteral "var(selected-urgent-background)";
          text-color = mkLiteral "var(selected-urgent-foreground)";
      };

      "element selected.active" ={
          background-color = mkLiteral "var(selected-active-background)";
          text-color = mkLiteral "var(selected-active-foreground)";
      };

      "element alternate.normal" ={
          background-color = mkLiteral "var(alternate-normal-background)";
          text-color = mkLiteral "var(alternate-normal-foreground)";
      };

      "element alternate.urgent" ={
          background-color = mkLiteral "var(alternate-urgent-background)";
          text-color = mkLiteral "var(alternate-urgent-foreground)";
      };

      "element alternate.active" ={
          background-color = mkLiteral "var(alternate-active-background)";
          text-color = mkLiteral "var(alternate-active-foreground)";
      };

      "element-text" = {
          background-color = mkLiteral "rgba(0, 0, 0, 0%)";
          text-color = mkLiteral "inherit";
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
      };

      "element-icon" = {
          background-color = mkLiteral "rgba(0, 0, 0, 0%)";
          size = mkLiteral "1.0000em";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
      };

      "window" ={
          padding = 10;
          border = 0;
          background-color = mkLiteral "var(background)";
          width = mkLiteral "25%";
      };

      "mainbox" ={
          padding = 0;
          border = 0;
      };

      "message" ={
          margin = mkLiteral "0px 7px";
      };

      "textbox" ={
          text-color = mkLiteral "var(foreground)";
      };

      "listview" ={
          margin = mkLiteral "0px 0px 5px";
          scrollbar = true;
          spacing = mkLiteral "10px";
          fixed-height = 0;
      };

      "scrollbar" ={
          padding = 0;
          handle-width = mkLiteral "14px";
          border = 0;
          handle-color = mkLiteral "var(nord3)";
      };

      "button" ={
          spacing = 0;
          text-color = mkLiteral "var(normal-foreground)";
          cursor = mkLiteral "pointer";
      };

      "button selected" ={
          background-color = mkLiteral "var(selected-normal-background)";
          text-color = mkLiteral "var(selected-normal-foreground)";
      };

      "inputbar" ={
          padding = mkLiteral "7px";
          margin = mkLiteral "7px";
          spacing = 0;
          text-color = mkLiteral "var(normal-foreground)";
          background-color = mkLiteral "var(nord3)";
          children = mkLiteral "[ entry ]";
      };

      "entry" ={
          spacing = 0;
          cursor = mkLiteral "text";
          text-color = mkLiteral "var(normal-foreground)";
          background-color = mkLiteral "var(nord3)";
      };
    }; 
  };

  programs.git = {
    enable = true;
    userName = "Quinton Jasper";
    userEmail = "dropatuningmetal@gmail.com";
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # ====== cursor theme config ======
  home.pointerCursor = {
    package = pkgs.quintom-cursor-theme;
    gtk.enable = true;
    name = "Quintom_Ink";
    size = 24;

  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-nord.override { accent = "frostblue3"; };
      name = "Papirus-Dark";
    };

    theme = {
      package = pkgs.nordic;
      name = "Nordic-bluish-accent";
    };

  };

  # ====== bash config ======
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      vim = "nvim";
      sudo = "sudo ";
    };
  };

  # ====== kitty config ======
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 5;
      background_opacity = "0.8";
    };
    theme = "Nord";
    font.package = pkgs.fira-code;
    font.name = "Fira Code Medium";
  };

  # ====== dunst config ======
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        frame_color = "#${config.colorScheme.palette.base05}";
        separator_color = "#${config.colorScheme.palette.base05}";
        font = "Droid Sans 9";
	};

      urgency_normal = {
        background = "#${config.colorScheme.palette.base02}";
        foreground = "#${config.colorScheme.palette.base05}";
        timeout = 10;
      };

      urgency_critical = {
        background = "#${config.colorScheme.palette.base08}";
        foreground = "#${config.colorScheme.palette.base06}";
      };

      urgency_low = {
        background = "#${config.colorScheme.palette.base01}";
        foreground = "#${config.colorScheme.palette.base03}";
      };
    };
  };

  # ====== waybar config ======
  programs.waybar = {
    enable = true;
    package =  (pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];}));
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 10;
        margin-top = 5;
        margin-left = 5;
        margin-right = 5;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = ["clock"];
        modules-right = [ "battery" "pulseaudio" "network" "tray" "custom/power" ];

        "tray" = {
          spacing = 5;
          icon-size = 18;
        };

        "clock" = {
          format = "{:%H:%M}  ";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            on-click-right = "mode";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today =  "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        "custom/power" = {
          format = " ⏻ ";
          tooltip = false;
          on-click = "rofi -show p -modi p:rofi-power-menu";
        };

        "actions" = {
          on-click-right = "mode";
        };

      };
    };

    style = ''
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        font-size: 13px;
        border-radius: 2px;
        opacity: 1;
      }

      window#waybar {
          background-color: #${config.colorScheme.palette.base00};
          opacity: ${opacity};
          border: 2px;
          border-color: #${config.colorScheme.palette.base01};
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s; 
      }

      .modules-left {
        padding: 5px;
      }

      .modules-right {
        padding: 5px;
      }

      .modules-center {
        padding: 5px;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      } 

      #workspaces button {
          padding: 0 10px;
          background-color: #${config.colorScheme.palette.base01};
          color: #${config.colorScheme.palette.base05};
      }

      #workspaces button:hover {
          background-color: #${config.colorScheme.palette.base02};
          color: #${config.colorScheme.palette.base06};
          border: none;
      }

      #workspaces button:focus {
          background: #${config.colorScheme.palette.base00};
          border-bottom: #${config.colorScheme.palette.base06};
      }

      #workspaces button.urgent {
          background-color: #${config.colorScheme.palette.base08};
      }

      #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
          padding: 0 10px;
          color: #ffffff;
      }

      #window,
      #workspaces {
          margin: 0 4px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          background-color: #${config.colorScheme.palette.base01};
      }

      #battery {
          background-color: #ffffff;
          color: #000000;
      }

      #battery.charging, #battery.plugged {
          color: #ffffff;
          background-color: #26A65B;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }

      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      label:focus {
          background-color: #000000;
      }

      #cpu {
          background-color: #2ecc71;
          color: #000000;
      }

      #memory {
          background-color: #9b59b6;
      }

      #disk {
          background-color: #964B00;
      }

      #backlight {
          background-color: #90b1b1;
      }

      #network {
          background-color: #${config.colorScheme.palette.base02};
      }

      #network.disconnected {
          background-color: #f53c3c;
      }

      #pulseaudio {
          background-color: #${config.colorScheme.palette.base0F};
          color: #${config.colorScheme.palette.base06};
      }

      #pulseaudio.muted {
          background-color: #${config.colorScheme.palette.base08};
          color: #FFFFFF;
      }

      #wireplumber {
          background-color: #fff0f5;
          color: #000000;
      }

      #wireplumber.muted {
          background-color: #f53c3c;
      }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
      }

      #custom-media.custom-spotify {
          background-color: #66cc99;
      }

      #custom-media.custom-vlc {
          background-color: #ffa000;
      }

      #temperature {
          background-color: #f0932b;
      }

      #temperature.critical {
          background-color: #eb4d4b;
      }

      #tray {
          background-color: #${config.colorScheme.palette.base0F};
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }

      #idle_inhibitor {
          background-color: #2d3436;
      }

      #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
      }

      #mpd {
          background-color: #66cc99;
          color: #2a5c45;
      }

      #mpd.disconnected {
          background-color: #f53c3c;
      }

      #mpd.stopped {
          background-color: #90b1b1;
      }

      #mpd.paused {
          background-color: #51a37a;
      }

      #language {
          background: #00b093;
          color: #740864;
          padding: 0 5px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state {
          background: #97e1ad;
          color: #000000;
          padding: 0 0px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state > label {
          padding: 0 5px;
      }

      #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
          background-color: transparent;
      }

      #privacy {
          padding: 0;
      }

      #privacy-item {
          padding: 0 5px;
          color: white;
      }

      #privacy-item.screenshare {
          background-color: #cf5700;
      }

      #privacy-item.audio-in {
          background-color: #1ca000;
      }

      #privacy-item.audio-out {
          background-color: #0069d4;
      }
    '';
  };

  # ====== Neovim configuration ======
  programs.neovim =
  let
     toLua = str: "lua << EOF\n${str}\nEOF\n";
     toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;



    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp

      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [

      {
        plugin = nvim-lspconfig;
        #config = toLuaFile ./nvim/plugin/lsp.lua;
      }

      {
        plugin = copilot-vim;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = nord-nvim;
        config = "colorscheme nord";
      }

      neodev-nvim

      nvim-cmp 
      {
        plugin = nvim-cmp;
        #config = toLuaFile ./nvim/plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        #config = toLuaFile ./nvim/plugin/telescope.lua;
      }

      telescope-fzf-native-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets


      lualine-nvim
      nvim-web-devicons

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
        ]));
        #config = toLuaFile ./nvim/plugin/treesitter.lua;
      }

      vim-nix
    ];

    extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '

      vim.o.clipboard = 'unnamedplus'

      vim.o.number = true
      vim.o.relativenumber = true

      vim.o.signcolumn = 'yes'

      vim.o.tabstop = 4
      vim.o.shiftwidth = 4

      vim.o.updatetime = 300

      vim.o.termguicolors = true

      vim.o.mouse = 'a'

      vim.o.undofile = true

      vim.o.completeopt = 'menuone,noselect'
      vim.o.breakindent = true

      vim.o.ignorecase = true
      vim.o.smartcase = true

    '';
  };

  # ====== Hyprland Config ======
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "HDMI-A-1,preferred,0x0,auto"
        "DP-1,preferred,1920x0,auto"
        ];
        env = [
          "XCURSOR_SIZE,24"
       #   "WLR_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
        ];
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = "1";

        touchpad = {
          natural_scroll = "yes";
        };

        sensitivity = "0";
      };

      general = {
        gaps_in = "5";
        gaps_out = "5";
        border_size = "1";
        "col.active_border" = "rgba(${config.colorScheme.palette.base0B}aa)";
        "col.inactive_border" = "rgba(${config.colorScheme.palette.base02}aa)";

        layout = "master";

        allow_tearing = "false";
      };

      decoration = {
        rounding = "2";
        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
        };

        drop_shadow = "yes";
        shadow_range = "4";
        shadow_render_power = "3";
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = { 
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = "true";
      };

      gestures = {
        workspace_swipe = "true";
      };

      misc = {
        force_default_wallpaper = "0";
      };

      "device:epic-mouse-v1" = {
        sensitivity = "-0.5";
      };

      "$mainMod" = "ALT";
      "$mouseMod" = "mouse:274";

      bindr = [
      ];

      bind = [
        "$mainMod, D, exec, rofi -show drun -show-icons"
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, V, togglefloating,"
        "$mainMod SHIFT, E, exec, rofi -show p -modi p:rofi-power-menu"
        ",Print, exec, grim -g \"\$(slurp)\""

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, L, exec, swaylock-fancy"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        ",XF86AudioRaiseVolume,exec,amixer set Master 5%+"
        ",XF86AudioLowerVolume,exec,amixer set Master 5%-"
        ",XF86AudioMute,exec,amixer set Master toggle"
        ",XF86AudioPlay,exec,playerctl play-pause"
        #",XF86AudioNext,exec,playerctl next"
        #",XF86AudioPrev,exec,playerctl previous"
        ", XF86MonBrightnessUp, exec, brightnessctl -s set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl -s set 5%-"
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
      ];

      bindm = [
        "$mainMod, mouse:274, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Application Autostart
      exec-once = [
        "swww init"
        "swww img ./nordic-wallpapers/wallpapers/nord_buildings.png"
        "nm-applet --indicator"
        "blueman-applet"
        "waybar"
        "nextcloud --background"
        "swayidle -w timeout 300 'swaylock-fancy"
      ];

      windowrulev2 = [
        "bordercolor rgb(${config.colorScheme.palette.base08}),fullscreen:1"
      ];
    };
  };
}
