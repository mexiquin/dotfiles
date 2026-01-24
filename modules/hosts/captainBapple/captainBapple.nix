{ ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
  ];

  # Set hostname
  networking.hostName = "CaptainBapple";

  # Scale SDDM for Retina display
  services.displayManager.sddm.settings = {
    General = {
      GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=2";
    };
  };
}
