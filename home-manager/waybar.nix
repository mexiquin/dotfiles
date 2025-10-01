{ config, pkgs, ... }:

let
    opacity = "1";
in
{
  
programs.waybar = {
    enable = true;
    package = pkgs.waybar;
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

        "pulseaudio" = {
            format = "{icon}  {volume}%";
            format-muted = " ";
            format-icons = {
                default = [" " "  "];
            };
            on-click = "pavucontrol";
        };

        "clock" = {
          format = "{:%I:%M %p}";
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
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base05};
          border-bottom: 1px solid #${config.colorScheme.palette.base00}
      }

      #workspaces button:hover {
          background-color: #${config.colorScheme.palette.base02};
          color: #${config.colorScheme.palette.base06};
          border: none;
      }

      #workspaces button.active {
          background: #${config.colorScheme.palette.base01};
          border-bottom: 1px solid #${config.colorScheme.palette.base0B};
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
}
