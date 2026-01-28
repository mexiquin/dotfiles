{ pkgs, ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
    ../../nixos/hardware/nvidia.nix
  ];

  networking.hostName = "blackbox"; # Define your hostname.
  services.ollama.acceleration = "cuda";

  # List packages installed in system profile for this host only.
  environment.systemPackages = with pkgs; [
  ];
}
