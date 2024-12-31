{ config, ...}:

let
# TODO - I don't like this not being dynamic. I'll figure this one out some day.
  monitorConfig = "source = /home/quinton/.config/hypr/monitors.conf";
in
{
 wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
    ${monitorConfig}
    '';
    
    settings = {
      env = [
          "XCURSOR_SIZE,24"
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

        #drop_shadow = "yes";
        #shadow_range = "4";
        #shadow_render_power = "3";
        #"col.shadow" = "rgba(1a1a1aee)";
      };

      animations = { 
        enabled = "no";
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
        #new_is_master = "true";
      };

      gestures = {
        workspace_swipe = "true";
      };

      misc = {
        force_default_wallpaper = "0";
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };

      "$mainMod" = "SUPER";
      "$mouseMod" = "mouse:274";

      bindr = [
      ];

      bind = [
        "$mainMod, D, exec, fuzzel"
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, V, togglefloating,"
        "$mainMod SHIFT, E, exec, wlogout"
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
        "nm-applet --indicator"
        "blueman-applet"
        "waybar"
        "nextcloud --background"
        "swayidle -w timeout 300 swaylock-fancy"
      ];

      windowrulev2 = [
        "bordercolor rgb(${config.colorScheme.palette.base08}),fullscreen:1"
        "stayfocused, class:^rofi$"
      ];
    };
  };
}
