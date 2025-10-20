{ pkgs, ... }:
let
  themePkg = pkgs.colloid-gtk-theme.override {
    colorVariants = [ "dark" ];
    sizeVariants = [ "standard" ];
    themeVariants = [ "orange" ];
    tweaks = [ "gruvbox" ];
  };

  iconPkg = pkgs.colloid-icon-theme.override {
    schemeVariants = [ "gruvbox" ];
    colorVariants = [ "orange" ];
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
      name = "Colloid-Orange-Gruvbox-Dark";
    };

    theme = {
      package = themePkg;
      name = "Colloid-Orange-Dark-Gruvbox";
    };

  };
}
