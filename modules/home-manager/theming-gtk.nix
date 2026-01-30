{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.quintom-cursor-theme;
    gtk.enable = true;
    name = "Quintom_Ink";
    size = 24;
  };

  home.packages = with pkgs; [ pkgs.tela-icon-theme ];

  gtk = {
    enable = true;

    colorScheme = "dark";

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    gtk3.extraCss = ''
      @import url("./noctalia.css");
    '';

    gtk4.extraCss = ''
      @import url("./noctalia.css");
    '';
  };
}
