{ config, pkgs, ... }:

let
    inherit (config.lib.formats.rasi) mkLiteral;
in
{
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
}
