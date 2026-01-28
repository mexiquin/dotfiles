{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ../../nixos
    ./hardware-configuration.nix
  ];

  # Set hostname
  networking.hostName = "lilbuddy";

  # List packages installed in system profile for this host only.
  environment.systemPackages = with pkgs; [
  ];
}
