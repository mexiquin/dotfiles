{ config, pkgs, ... }:

{
  imports = [ ./nvidia.nix ];

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    # Bus ID of the Intel GPU. You can find it using lspci, either under "VGA compatible controller" or "Display controller".
    intelBusId = "PCI:0:2:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under "VGA compatible controller" or "Display controller".
    nvidiaBusId = "PCI:1:0:0";
  };
}
