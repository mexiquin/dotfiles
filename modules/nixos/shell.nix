{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    
    promptInit = ''
      eval "$(starship init zsh)"
      autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    '';
  
    shellAliases = {
      # leaving this blank for now
    };
  };
}
