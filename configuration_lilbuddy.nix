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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # auto storage optimization
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # laptop battery optimizations
  services.tlp.enable = true;
  powerManagement.powertop.enable = true;
  
  networking.hostName = "lilbuddy"; # Define your hostname.

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.lightdm.enable = true;
  };

  # enable polkit
  security.polkit.enable = true;

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
      vivaldi
      vivaldi-ffmpeg-codecs
      sublime-merge
      remmina
      gh
      rclone
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  swaylock
  swayidle
  wget
  libnotify
  neovim
  virtiofsd
  most
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
  pcmanfm
  networkmanager-openconnect
  ];

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
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
