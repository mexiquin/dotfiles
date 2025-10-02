{ config, pkgs, ... }:

{
 programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
