{ pkgs, ... }:
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
      package = pkgs.tela-icon-theme;
      name = "Tela-circle-dark";
    };

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

  };
}
