#Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # disable fish greeting
      '';
    };

  # Bootloader.
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

  # auto storage optimization
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  networking.hostName = "BLACKBOX-NIX"; # Define your hostname.

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.sddm.enable = true;
    displayManager.sddm.autoNumlock = true;
    displayManager.sddm.theme = "chili"; 
    #displayManager.lightdm.greeters.slick.enable = true;
  };

  # enable polkit
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

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Phoenix";
  
  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;
  hardware.bluetooth.enable = true;
  services.xserver.libinput.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
    google-fonts
  ];
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

  # enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  security.pam.services.swaylock = {};
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    nvidia = {
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
      sublime-merge
      remmina
      gh
      rclone
      vivaldi
      vivaldi-ffmpeg-codecs
      firefox
      meld
      gimp-with-plugins
      libreoffice-fresh
      keepassxc
      nextcloud-client
      sublime4
      nicotine-plus
    ];
  };
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    man-pages
    nodejs_20
    mpv
    imv
    grim
    slurp
    unzip
    #swaylock
    swaylock-fancy
    swayidle
    wget
    libnotify
    neovim
    virtiofsd
    dconf
    neofetch
    home-manager
    htop
    tmux
    tree
    git
    dunst
    swww
    brightnessctl
    networkmanagerapplet
    kitty
    xdg-desktop-portal-gtk
    rofi-wayland
    rofi-power-menu
    networkmanager-openconnect
    ranger
    pcmanfm
    sddm-chili-theme
  ];

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
    nixos.includeAllModules = true;
  };

  # List services that you want to enable:


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "23.11"; # Did you read the comment?

  # add flake features
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
  
  # onedrive enable
  #services.onedrive.enable = true;
  
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  # enable pwfeedback
  security.sudo.extraConfig = ''
    Defaults    pwfeedback
  '';

  # virt-manager configuration
  #virtualisation.libvirtd.enable = true;
  #programs.virt-manager.enable = true;

  # allow openssl v 1.1.1
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
}
