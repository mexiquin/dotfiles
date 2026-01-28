{ pkgs, ... }: {
  # enable sddm
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6 = {
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
