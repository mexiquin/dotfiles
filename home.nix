{ inputs, ... }:
{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./home-manager/wlsunset.nix
    ./home-manager/rofi.nix
    ./home-manager/git.nix
    ./home-manager/waybar.nix
    ./home-manager/hyprland.nix
    ./home-manager/dunst.nix
    ./home-manager/theming-gtk.nix
    ./home-manager/kitty.nix
    ./home-manager/hyprpaper.nix
    ./home-manager/hyprlock.nix
    ./home-manager/hypridle.nix
    ./home-manager/btop.nix
    ./home-manager/starship.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  home.username = "quinton";
  home.homeDirectory = "/home/quinton";

  home.stateVersion = "23.05";

  home.packages = [
  ];

  home.file = {
    ".config/nixpkgs/config.nix".text = "{allowUnfree = true;}";
  };

  # set default applications
  xdg = {
    # Create and manage standard home folders (Desktop, Downloads, Pictures, etc.)
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    # set default applications
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/about" = [ "firefox.desktop" ];
        "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      };
    };
  };
}
