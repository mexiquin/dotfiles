{
  description = "Quinton's Tiling Desktop Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:

    let
      lib = nixpkgs.lib;
      homemanager = home-manager.nixosModules.home-manager;
      hm-config = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.quinton = import ./home.nix;
        home-manager.extraSpecialArgs = { inherit inputs; };
      };

    in
    {
      nixosConfigurations = {
        nuc = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nuc_configuration.nix
            homemanager
            hm-config

          ];
        };

        lilbuddy = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./lilbuddy_config.nix
            homemanager
            hm-config
          ];
        };

        blackbox = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./blackbox_config.nix
            homemanager
            hm-config
          ];
        };
      };
    };
}
