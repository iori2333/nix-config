{ inputs, lib, pkgs, config, outputs, ... }:
let
  inherit (inputs.nix-colors) colors;
in {
  imports = [
    inputs.nix-colors.homeManagerModule
  ] ++ (outputs.homeManagerModules);

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;

  home = {
    username = "iori";
    homeDirectory = "/home/iori";
    stateVersion = "23.05";
  };
}