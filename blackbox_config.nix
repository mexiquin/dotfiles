{ ... }:

{
  imports = [
    ./core.nix
    ./helpers/hardware-configs/blackbox-hardware-config.nix
    ./helpers/nixos/nvidia.nix
  ];

  networking.hostName = "blackbox"; # Define your hostname.

  # Ollama service for blackbox only (since its got the GPU and stuff)
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  services.open-webui.enable = true;
}
