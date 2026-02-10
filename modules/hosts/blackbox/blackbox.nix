{ pkgs, ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
    ../../nixos/hardware/nvidia.nix
  ];

  networking.hostName = "blackbox"; # Define your hostname.

  # List packages installed in system profile for this host only.
  environment.systemPackages = with pkgs; [
  ];

  # enable steam on this gaming pc
  programs.steam.enable = true;
}
