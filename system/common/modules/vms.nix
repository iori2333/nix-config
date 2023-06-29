{ lib, pkgs, ... }:

{
  virtualisation = {
    docker.enable = true;
    waydroid.enable = lib.mkDefault false;
    lxd.enable = lib.mkDefault false;
  };
}