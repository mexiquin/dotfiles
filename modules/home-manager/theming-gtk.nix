{ pkgs, ... }:
{

  # ====== cursor theme config ======
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };

    cursorTheme = {
      package = pkgs.quintom-cursor-theme;
      name = "Quintom_Ink";
      size = 16;
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
