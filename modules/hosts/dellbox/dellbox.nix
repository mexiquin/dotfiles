
{ pkgs, ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
    ../../nixos/hardware/nvidia.nix
  ];

  networking.hostName = "dellbox"; # Define your hostname.

  # List packages installed in system profile for this host only.
  environment.systemPackages = with pkgs; [
    steam
  ];
}
