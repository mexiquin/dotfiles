{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adw-gtk3-dark";
    qt6ctSettings = {
      Appearance = {
        style = "adw-gtk3-dark";
        icon-theme = "Tela-dark";
      };
    };
  };
}
