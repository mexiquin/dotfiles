{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 5;
      background_opacity = "0.9";
    };
    themeFile = "GruvboxMaterialDarkHard";
    font.package = pkgs.nerd-fonts.fira-code;
    font.name = "Fira Code Medium";
  }; 
}
