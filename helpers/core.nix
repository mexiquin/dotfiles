{ pkgs, ... }:

{
  imports =
    [
      ./nixos/fish.nix
    ];
  
  # auto storage optimization
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Bootloader
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
    };
  };

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
  };

  services.xserver.enable = true;

  #enable polkit
  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
};
 
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
  };
  
  # Set your time zone.
  time.timeZone = "America/Phoenix";
 
  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true; 

  hardware.bluetooth.enable = true;
  services.libinput.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

 fonts.fontDir.enable = true;
 fonts.packages = with pkgs; [
  font-awesome
  google-fonts
 ];

 # enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

 security.pam.services.swaylock = {};
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    TERMINAL = "kitty";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
 
   
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.quinton = {
    isNormalUser = true;
    description = "Quinton Jasper";
    extraGroups = [ "networkmanager" "wheel" "video" "kvm" "libvirtd" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      lazygit
      remmina
      gh
      rclone
      meld
      libreoffice-fresh
      nicotine-plus
      foliate
      chromium
    ];
  };
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    man-pages
    vlc
    firefox
    unzip
    wget
    helix
    home-manager
    htop
    tmux
    tree
    git
    openconnect
    mc
    imv
    grim 
    slurp
    swaylock-fancy
    swayidle
    libnotify
    dconf
    fastfetch
    dunst
    swww
    brightnessctl
    networkmanagerapplet
    kitty
    xdg-desktop-portal-gtk
    nil
    nwg-displays
    pavucontrol
   ];


  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  virtualisation.docker.enable = true;

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
    nixos.includeAllModules = true;
  };
  
  home-manager.backupFileExtension = "backup";

  # List services that you want to enable:


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 2234 ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true; 

  # add flake features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # enable pwfeedback
  security.sudo.extraConfig = ''
    Defaults    pwfeedback
  '';

  system.stateVersion = "23.11";
}
