{ pkgs, inputs, ... }:
{
  imports = [
    ./helpers/nixos/zsh.nix
    inputs.home-manager.nixosModules.default
  ];

  # auto storage optimization
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # enable COSMIC
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  # increase download buffer size to 500MB for rebuilds
  nix.settings.download-buffer-size = 524288000;

  # Use grub to enable detection of windows installs (if needed)
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

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
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
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "kvm"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  # prevent new user dialog for zsh
  system.userActivationScripts.zshrc = "touch .zshrc";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
  ];

  programs.firefox.preferences = {
    "widget.gtk.libadwaita-colors.enabled" = false;
  };

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

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "quinton" = import ./home.nix;
    };
  };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 2234 ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # add flake features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # enable pwfeedback
  security.sudo.extraConfig = ''
    Defaults    pwfeedback
  '';

  # config for neovim
  programs.nvf = {
    enable = true;

    settings = {
      vim = {

        binds = {
          whichKey.enable = true;
        };

        options = {
          tabstop = 2;
           shiftwidth = 0;
           expandtab = true;
          autoindent = true;
        };

        utility.sleuth.enable = true;

        viAlias = true;
        vimAlias = true;

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = true;
        };

        lineNumberMode = "number";

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        lsp.enable = true;


        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;

        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          python.enable = true;
          rust.enable = true;
          ts.enable = true;
          html.enable = true;
          css.enable = true;
        };
      };
    };
  };

  services.ollama = {
    enable = true;
  };

  services.open-webui.enable = true;

  system.stateVersion = "23.11";
}
