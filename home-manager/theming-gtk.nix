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
      package = pkgs.papirus-nord.override { accent = "frostblue3"; };
      name = "Papirus-Dark";
    };

    theme = {
      package = pkgs.nordic;
      name = "Nordic-bluish-accent";
    };

  };
}
