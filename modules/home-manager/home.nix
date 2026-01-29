{ inputs, pkgs, ... }:
{

  imports = [
    ./noctalia.nix
    ./git.nix
    ./btop.nix
    ./starship.nix
    ./niri/niri.nix
    ./kitty.nix
    ./theming-gtk.nix
    ./theming-qt.nix
    ./neovim.nix
  ];

  home.username = "quinton";
  home.homeDirectory = "/home/quinton";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    xwayland-satellite
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
