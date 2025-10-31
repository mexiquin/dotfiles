{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    
    promptInit = ''
      eval "$(starship init zsh)"
    '';
  
    shellAliases = {
      sudo = "sudo ";
      lgit = "lazygit";
      waybar-restart = "pkill waybar && hyprctl dispatch exec waybar";
    };
    
    loginShellInit = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
}
