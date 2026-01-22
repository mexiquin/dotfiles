{ ... }:

{
  imports = [
    ./core.nix
    ./helpers/hardware-configs/nuc-hardware-config.nix
  ];

  # Set hostname
  networking.hostName = "nuc";

}
