{ ... }: {
  imports = [
    ./shell.nix
    ./audio.nix
    ./boot.nix
    ./desktop.nix
    ./hardware.nix
    ./i18n.nix
    ./nix.nix
    ./networking.nix
    ./packages.nix
    ./programs.nix
    ./users.nix
    ./home-manager.nix
  ];

  system.stateVersion = "23.11";
}
