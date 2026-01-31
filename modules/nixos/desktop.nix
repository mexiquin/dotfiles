{ pkgs, ... }: {
  # enable sddm
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
    ];
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
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
