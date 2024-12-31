{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # disable fish greeting
      
      if command -v hx > /dev/null
        alias vim "hx"
        alias nvim "hx"
      end

      if command -v lazygit > /dev/null
        alias lgit "lazygit"
      end
    '';
  };
}
