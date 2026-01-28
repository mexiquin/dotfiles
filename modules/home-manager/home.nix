{ inputs, ... }:
{

  imports = [
    ./git.nix
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
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/about" = [ "firefox.desktop" ];
        "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      };
    };
  };
}
