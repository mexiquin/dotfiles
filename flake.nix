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

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {

    nixosConfigurations = {
      # config for nvidia (latest) setups
      BLACKBOX-NIX = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.quinton = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };

          }
        ];
      };

      # config for non-nvidia setups
      lilbuddy = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
	      ./configuration_lilbuddy.nix 
	      home-manager.nixosModules.home-manager {
		    home-manager.useGlobalPkgs = true;
		    home-manager.useUserPackages = true;
            home-manager.users.quinton = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
	      }
	    ];
      };
    };
  };
}
