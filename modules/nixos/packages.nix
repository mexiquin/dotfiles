{ pkgs, inputs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    remmina
    meld
    qt6Packages.qt6ct
    nwg-look
    chromium
    foliate
    nicotine-plus
    libreoffice-fresh
    man-pages
    mpv
    yt-dlp
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    unzip
    wget
    htop
    tmux
    tree
    git
    openconnect
    imv
    libnotify
    fastfetch
    brightnessctl
    networkmanagerapplet
    kitty
    xdg-desktop-portal-gtk
    nil
    nixfmt
    nwg-displays
    pavucontrol
    eddie
    pcmanfm
    adw-gtk3
    antigravity
    vesktop
    opencode
    bun
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
