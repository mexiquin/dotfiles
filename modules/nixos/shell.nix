{ ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      starship init fish | source
    '';

    shellAliases = {
      sudo = "sudo ";
      lgit = "lazygit";
      ldocker = "lazydocker";
    };
  };
}
