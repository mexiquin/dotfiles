{ inputs, ... }:
{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./wlsunset.nix
    ./rofi.nix
    ./git.nix
    ./waybar.nix
    ./hyprland.nix
    ./dunst.nix
    ./theming-gtk.nix
    ./kitty.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./btop.nix
    ./starship.nix
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
        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "x-scheme-handler/about" = [ "zen.desktop" ];
        "x-scheme-handler/unknown" = [ "zen.desktop" ];
      };
    };
  };
}
