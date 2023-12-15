{
  description = "New System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

    homeConfigurations.quinton = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	    modules = [ ./home.nix ];
      };

    nixosConfigurations = {
      # config for nvidia (latest) setups
      BLACKBOX-NIX = lib.nixosSystem {
        modules = [ ./configuration.nix ];
      };

      # config for non-nvidia setups
      lilbuddy = lib.nixosSystem {
        modules = [ ./configuration_lilbuddy.nix ];
      };
    };
  };
}