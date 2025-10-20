{ pkgs, ... }:
let
  themePkgs = pkgs.gruvbox-gtk-theme.override {
        colorVariants = ["dark"];
        sizeVariants = ["standard"];
        themeVariants = ["default"];
        tweakVariants = ["black"];
        iconVariants = ["Dark"];
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
      package = themePkgs;
      name = "Gruvbox-Dark";
    };

    theme = {
      package = themePkgs;
      name = "Gruvbox-Dark";
    };

  };
}
