{ pkgs, ... }: {
  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
  };

  # Set your time zone.
  time.timeZone = "America/Phoenix";
}
