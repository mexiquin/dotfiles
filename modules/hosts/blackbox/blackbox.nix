{ ... }:

{
  imports = [
    ../../core.nix
    ./hardware-configuration.nix
    ../../helpers/nixos/nvidia.nix
  ];

  networking.hostName = "blackbox"; # Define your hostname.
  services.ollama.acceleration = "cuda";
}
