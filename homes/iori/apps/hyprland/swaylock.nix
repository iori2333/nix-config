{ pkgs, config, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };
}