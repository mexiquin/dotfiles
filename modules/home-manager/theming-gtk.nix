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

    colorScheme = "dark";

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-yellow-dark";
    };

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
