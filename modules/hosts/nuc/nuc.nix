{ ... }:

{
  imports = [
    ../../nixos
    ./hardware-configuration.nix
  ];

  # Set hostname
  networking.hostName = "nuc";

}
