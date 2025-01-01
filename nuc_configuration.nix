{ ... }:

{
  imports =
    [
      ./helpers/core.nix
    ];

  # Set hostname
  networking.hostName = "nuc";
  
 }
