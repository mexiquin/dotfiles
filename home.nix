{ inputs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./home-manager/wlsunset.nix
    ./home-manager/rofi.nix
    ./home-manager/helix.nix
    ./home-manager/git.nix
    ./home-manager/waybar.nix
    ./home-manager/hyprland.nix
    ./home-manager/dunst.nix
    ./home-manager/theming-gtk.nix
    ./home-manager/kitty.nix
    ./home-manager/fuzzel.nix
    ./home-manager/wlogout.nix 
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;

  home.username = "quinton";
  home.homeDirectory = "/home/quinton";

  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
    ".config/nixpkgs/config.nix".text = "{allowUnfree = true;}";
  };

  programs.home-manager.enable = true;

  # Create and manage standard home folders (Desktop, Downloads, Pictures, etc.)
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };


  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # ====== bash config ======
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      sudo = "sudo ";
    };
  };
}
