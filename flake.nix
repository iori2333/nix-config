{
  description = "Iori's NixOS Flake";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirror.nju.edu.cn/nix-channels/store"
      "https://mirrors.bfsu.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{ self, nixpkgs, darwin, home-manager, ... }:
    let
      x64_system = "x86_64-linux";
      x64_specialArgs = {
        pkgs-unstable = import inputs.nixpkgs-unstable {
          system = x64_system;
          config.allowUnfree = true;
        };
      } // inputs;
      yoga14s_modules = [
        ./system/yoga14s
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.iori = import ./home/iori.nix;
          home-manager.extraSpecialArgs = x64_specialArgs;
        }
      ];
    in {
      nixosConfigurations = let
        system = x64_system;
        specialArgs = x64_specialArgs;
      in {
        "iori-yoga14s" = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = yoga14s_modules;
        };
      };
    };
}
