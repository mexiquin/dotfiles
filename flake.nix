{
  description = "Quinton's Tiling Desktop Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    wallpapers = {
      url = "git+https://codeberg.org/exorcist/wallpapers.git";
      flake = false;
    };

    nvf = {
      url = "github:NotAShelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
      ...
    }@inputs:

    {
      nixosConfigurations = {

        nuc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/hosts/nuc/nuc.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };

        lilbuddy = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/hosts/lilbuddy/lilbuddy.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };

        blackbox = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/hosts/blackbox/blackbox.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };

	captainbapple = nixpkgs.lib.nixosSystem {
	  specialArgs = { inherit inputs; };
	  modules = [
	    ./captainBapple_configuration.nix
	    inputs.nvf.nixosModules.default
	    inputs.home-manager.nixosModules.default
	  ];
	};
      };
    };
}
