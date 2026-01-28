{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      starship init fish | source
    '';

    shellAliases = {
      # leaving this blank for now
    };
  };
}
