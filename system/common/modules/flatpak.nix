{ config, lib, pkgs, ... }:

{
  services.flatpak.enable = true;

  # Fix font and icons for flatpak:
  # https://github.com/NixOS/nixpkgs/issues/119433#issuecomment-1326957279
  system.fsPackages = [ pkgs.bindfs ];
  fileSystems = lib.mapAttrs
    (_: v: v // {
      fsType = "fuse.bindfs";
      options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    })
    {
      "/usr/share/icons".device = "/run/current-system/sw/share/icons";
      "/usr/share/fonts".device = pkgs.buildEnv
        {
          name = "system-fonts";
          paths = config.fonts.fonts;
          pathsToLink = [ "/share/fonts" ];
        } + "/share/fonts";
    };
}