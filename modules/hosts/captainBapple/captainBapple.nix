{ ... }:

{
  imports = [
    ../../core.nix
    ./hardware-configuration.nix
  ];

  # Set hostname
  networking.hostName = "CaptainBapple";

}
