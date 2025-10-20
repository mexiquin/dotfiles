{ inputs, ... }:

let
  selected-image = "${inputs.wallpapers}/gruvbox/houseonthesideofalake.jpg";

in
{
  services.hyprpaper = {
    enable = true;
    settings = {

      splash = false;

      preload = [
        selected-image
      ];

      wallpaper = "," + selected-image;

    };
  };
}
