{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "quinton" = import ../home-manager/home.nix;
    };
  };
}
