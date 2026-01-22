{ ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./core.nix
    ./helpers/hardware-configs/lilbuddy-hardware-config.nix
  ];

  # Set hostname
  networking.hostName = "lilbuddy";
}
