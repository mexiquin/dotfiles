{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
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

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
  orca
  #evince
  # file-roller
  geary
  gnome-disk-utility
  # seahorse
  # sushi
  # sysprof
  #
  # gnome-shell-extensions
  #
  # adwaita-icon-theme
  # nixos-background-info
  #gnome-backgrounds
  # gnome-bluetooth
  # gnome-color-manager
  # gnome-control-center
  # gnome-shell-extensions
  gnome-tour # GNOME Shell detects the .desktop file on first log-in.
  gnome-user-docs
  # glib # for gsettings program
  # gnome-menus
  # gtk3.out # for gtk-launch program
  # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
  # xdg-user-dirs-gtk # Used to create the default bookmarks
  #
  #baobab
  epiphany
  gnome-text-editor
  #gnome-calculator
  #gnome-calendar
  #gnome-characters
  # gnome-clocks
  #gnome-console
  #gnome-contacts
  #gnome-font-viewer
  #gnome-logs
  #gnome-maps
  gnome-music
  # gnome-system-monitor
  #gnome-weather
  # loupe
  # nautilus
  #gnome-connections
  #simple-scan
  #snapshot
  totem
  yelp
  gnome-software
];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Phoenix";
  
  hardware.bluetooth.enable = true;
  services.libinput.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
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
  # DEPRECATED sound.enable = true;
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
    librewolf
    vlc
    unzip
    wget
    helix
    home-manager
    htop
    tmux
    tree
    git
    networkmanager-openconnect
    openconnect
    gleam
    mc
    dbeaver-bin
    vscode
   ];


  services.flatpak.enable = true;
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

  # add flake features
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # enable pwfeedback
  security.sudo.extraConfig = ''
    Defaults    pwfeedback
  '';

  system.stateVersion = "23.11";
  }
