{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zerotierone
  ];
  services.zerotierone.enable = true;
}