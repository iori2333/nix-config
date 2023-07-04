{ pkgs, ... }:

{
  home.packages = with pkgs; [
    handbrake
    kdenlive
    ffmpeg
  ];
}