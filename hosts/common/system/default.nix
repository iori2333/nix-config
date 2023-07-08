{ ... }:

{
  imports = [
    ./nix.nix
    ./locales.nix
    ./shell.nix
  ];

  services.geoclue2.enable = true;
  programs.dconf.enable = true;
}