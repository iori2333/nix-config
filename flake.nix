{
  description = "Iori's NixOS Flake";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store/"
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
    hardware.url = "github:nixos/nixos-hardware";
    nix-colors.url = "github:misterio77/nix-colors";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      arm64_system = "aarch64-linux";
      x64_system = "x86_64-linux";
      systems = [ x64_system arm64_system ];
      pkgsFor = nixpkgs.legacyPackages;
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      lib = nixpkgs.lib // home-manager.lib;
    in {
      inherit lib;

      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });

      homeManagerModules = [
        ./modules/font-profiles.nix
      ];

      nixosConfigurations = {
        mika = lib.nixosSystem {
          modules = [ ./hosts/mika ];
          specialArgs = { inherit inputs outputs; };
        };
      };

      homeConfigurations = {
        "iori@mika" = lib.homeManagerConfiguration {
          modules = [ ./homes/iori/mika.nix ];
          pkgs = nixpkgs.legacyPackages.${x64_system};
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}