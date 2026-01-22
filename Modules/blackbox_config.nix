{ ... }:

{
  imports = [
    ./core.nix
    ./helpers/hardware-configs/blackbox-hardware-config.nix
    ./helpers/nixos/nvidia.nix
  ];

  networking.hostName = "blackbox"; # Define your hostname.
  services.ollama.acceleration = "cuda";
}
