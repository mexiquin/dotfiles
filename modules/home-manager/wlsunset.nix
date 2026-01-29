{ config, pkgs, ... }:

{
  services.wlsunset = {
    enable = true;
    latitude = "33.440";
    longitude = "-112.074";
  };
}
