{
  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    nvidia = {
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
      open = true;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];
}
