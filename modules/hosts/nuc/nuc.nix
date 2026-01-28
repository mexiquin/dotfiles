{ ... }: {
  imports = [
    ../../nixos
    ./hardware-configuration.nix
  ];

  # Set hostname
  networking.hostName = "nuc";

  # List packages installed in system profile for this host only.
  environment.systemPackages = with pkgs; [
  ];
}
