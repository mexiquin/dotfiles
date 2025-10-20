{ pkgs, ... }:
let
  themePkg = pkgs.colloid-gtk-theme.override {
    colorVariants = [ "dark" ];
    sizeVariants = [ "standard" ];
    themeVariants = [ "green" ];
    tweaks = [ "gruvbox" ];
  };

  iconPkg = pkgs.colloid-icon-theme.override {
    schemeVariants = [ "gruvbox" ];
    colorVariants = [ "green" ];
  };
in
{

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
      package = iconPkg;
      name = "Colloid-Green-Gruvbox-Dark";
    };

    theme = {
      package = themePkg;
      name = "Colloid-Green-Dark-Gruvbox";
    };

  };
}
