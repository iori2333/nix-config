{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zerotierone
  ];
  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "a09acf023378ea18"
    ];
  };
}