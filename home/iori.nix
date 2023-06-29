{ ... }:

{
  imports = [
    ./common/desktop.nix
    ./common/develop.nix
    ./common/media.nix
  ];

  home = {
    username = "iori";
    homeDirectory = "/home/iori";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}