{...}:

{
    imports =
    [
      ./helpers/core.nix
      ./helpers/nixos/nvidia.nix
    ];
    
    networking.hostName = "BLACKBOX"; # Define your hostname.
}
