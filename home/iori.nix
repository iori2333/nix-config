{ ... }:

{
  imports = [
    ./common/desktop.nix
    ./common/develop.nix
  ];

  home = {
    username = "iori";
    homeDirectory = "/home/iori";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}