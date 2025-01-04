{...}:

{
    imports =
    [
      ./helpers/core.nix
      ./helpers/hardware-configs/blackbox-hardware-config.nix
      ./helpers/nixos/nvidia.nix
    ];
    
    networking.hostName = "BLACKBOX"; # Define your hostname.
}
