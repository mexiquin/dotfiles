{ pkgs, ... }:

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

  # List packages installed in system profile for this host only.
  environment.systemPackages = with pkgs; [
  ];
}
