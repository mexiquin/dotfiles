{ ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
    ../../nixos/hardware/nvidia.nix
  ];

  networking.hostName = "blackbox"; # Define your hostname.
  services.ollama.acceleration = "cuda";
}
