{ ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ../../core.nix
    ./hardware-configuration.nix
  ];

  # Set hostname
  networking.hostName = "lilbuddy";
}
