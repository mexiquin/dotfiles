{ ... }: {
  # auto storage optimization
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # increase download buffer size to 500MB for rebuilds
  nix.settings.download-buffer-size = 524288000;

  # add flake features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
