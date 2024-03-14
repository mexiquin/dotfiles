{
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    nvidia = {
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];
}
