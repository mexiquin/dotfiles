{
  description = "New System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {

    nixosConfigurations = {
      # config for nvidia (latest) setups
      BLACKBOX-NIX = lib.nixosSystem {
        modules = [ 
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.quinton = import ./home.nix;
          }
        ];
      };

      # config for non-nvidia setups
      lilbuddy = lib.nixosSystem {
        modules = [ ./configuration_lilbuddy.nix ];
      };
    };
  };
}
