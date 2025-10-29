{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    
    promptInit = ''
      PROMPT="%B%F{green}[%n@%m in %2d] $ %f%b"
    '';
  
    shellAliases = {
      sudo = "sudo ";
      lgit = "lazygit";
    };
    
    loginShellInit = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
}
