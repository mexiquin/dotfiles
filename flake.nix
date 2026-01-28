{
  description = "Quinton's Cosmic Desktop Flake";

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

    # Cosmic
    cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
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
            inputs.cosmic.nixosModules.default
          ];
        };

        lilbuddy = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/hosts/lilbuddy/lilbuddy.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
            inputs.cosmic.nixosModules.default
          ];
        };

        blackbox = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/hosts/blackbox/blackbox.nix
            inputs.nvf.nixosModules.default
            inputs.home-manager.nixosModules.default
            inputs.cosmic.nixosModules.default
          ];
        };
      };
    };
}
