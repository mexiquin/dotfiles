{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Quinton Jasper";
    userEmail = "dropatuningmetal@gmail.com";
  };
}
