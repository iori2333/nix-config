{ pkgs, ... }:

{
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    docker-compose
    vscode
  ];
}