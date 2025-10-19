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
    ./home-manager/hyprpaper.nix
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      sudo = "sudo ";
      vim = "hx ";
    };
    profileExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };

}
