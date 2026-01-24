{ pkgs, ... }: {
  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 2234 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
