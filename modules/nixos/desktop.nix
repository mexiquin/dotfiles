{ pkgs, ... }:
{
  # enable sddm
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where_is_my_sddm_theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qt5compat
      kdePackages.qtsvg
    ];
  };

  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];

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
    nerd-fonts.fira-code
  ];
}
