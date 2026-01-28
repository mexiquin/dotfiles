{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    remmina
    meld
    chromium
    foliate
    nicotine-plus
    libreoffice-fresh
    lazygit
    lazydocker
    man-pages
    vlc
    firefox
    unzip
    wget
    htop
    tmux
    tree
    git
    openconnect
    fastfetch
    nil
    eddie
    antigravity
    vesktop
  ];

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
