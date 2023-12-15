{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "quinton";
  home.homeDirectory = "/home/quinton";

  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    PAGER = "most";
  };

  programs.home-manager.enable = true;

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
  
  # ====== GTK styles ======
  gtk = {
    enable = true;
    cursorTheme.package = pkgs.quintom-cursor-theme;
    cursorTheme.name = "Quintom_Ink";
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
    };
    theme = "Gruvbox Dark";
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
        frame_color = "#eceff1";
        font = "Droid Sans 9";
	};

    urgency_normal = {
        background = "#37474f";
        foreground = "#eceff1";
        timeout = 10;
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
      modules-left = [ "hyprland/workspaces" ];
      modules-center = ["clock"];
      modules-right = [ "battery" "pulseaudio" "network" "tray" "custom/power" ];

      "clock" = {
	    calendar = {
          mode = "year";
	      on-click-right = "mode";
        };
      };

      "custom/power" = {
        format = " ⏻ ";
        tooltip = false;
        on-click = "wlogout --protocol layer-shell";
      };

      "actions" = {
        on-click-right = "mode";
      };

    };
    }; 
  };

  # ====== wlogout config ======
  programs.wlogout = {
    enable = true;

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
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
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

      # {
      #   plugin = vimPlugins.own-onedark-nvim;
      #   config = "colorscheme onedark";
      # }
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
      monitor = ",preferred,auto,auto";
      env = "XCURSOR_SIZE,24";
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
        "col.active_border" = "rgba(b8bb26aa)";
        "col.inactive_border" = "rgba(595959aa)";

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

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, V, togglefloating,"

        "$mainMod, D, exec, rofi -show drun -show-icons"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

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
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Application Autostart
      exec-once = [
        "swww init"
        "swww img ~/Pictures/wallpaper.jpg"
        "nm-applet --indicator"
        "blueman-applet"
        "waybar"
      ];
    };
  };
}
