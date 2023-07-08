{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vim
  ];
  home.sessionVariables.EDITOR = "vim";
}