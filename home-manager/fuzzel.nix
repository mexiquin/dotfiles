{ config, ... }:

let
  rgbaHelpers = import ../helpers/rgbaFuncs.nix;
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = "100";
        tabs = "4";
        terminal = "$TERMINAL sh -c";
      };

      border = {
        radius = "5";
      };

      colors = {
        background = rgbaHelpers.toRGBASemi config.colorScheme.palette.base01;
        text = rgbaHelpers.toRGBASolid config.colorScheme.palette.base06;
        selection = rgbaHelpers.toRGBASemi config.colorScheme.palette.base0D;
        selection-text = rgbaHelpers.toRGBASemi config.colorScheme.palette.base01;
        border = rgbaHelpers.toRGBASolid config.colorScheme.palette.base0B;
      };
    };
  };
}
