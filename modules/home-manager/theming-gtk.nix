{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.quintom-cursor-theme;
    gtk.enable = true;
    name = "Quintom_Ink";
    size = 24;
  };

  home.packages = with pkgs; [
    tela-icon-theme
    adw-gtk3
  ];

  gtk = {
    enable = true;

    colorScheme = "dark";

    gtk3.extraCss = ''
      @import url("./noctalia.css");
    '';

    gtk4.extraCss = ''
      @import url("./noctalia.css");
    '';
  };
}
