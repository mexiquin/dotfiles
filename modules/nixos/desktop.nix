{ pkgs, ... }: {
  # enable sddm
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${
      pkgs.where-is-my-sddm-theme.override { variants = [ "qt5" ]; }
    }/share/sddm/themes/where_is_my_sddm_theme_qt5";
  };

  programs.niri = {
    enable = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    font-awesome
    google-fonts
  ];
}
