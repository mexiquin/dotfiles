let
  selected-image = "../wallpapers/octopus.jpg";

in
{
  services.hyprpaper = {
    enable = true;
    settings = {

      preload = [
        selected-image
      ];

      wallpaper = selected-image;

    };
  };
}
