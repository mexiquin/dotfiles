{ pkgs, ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
    ../../nixos/hardware/nvidia-hybrid.nix
  ];

  networking.hostName = "XPSBoyo"; # Define your hostname.

  # List packages installed in system profile for this host only.
  environment.systemPackages = with pkgs; [
  ];
}
