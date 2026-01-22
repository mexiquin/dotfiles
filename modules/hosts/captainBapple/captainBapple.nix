{ ... }:

{
  imports = [
    ./core.nix
    ./helpers/hardware-configs/captain-bapple-hardware-config.nix
  ];

  # Set hostname
  networking.hostName = "CaptainBapple";

}
