{ config, lib, pkgs, ... }:

{
  ###################################################################################
  #
  #  Copy from https://github.com/NixOS/nixpkgs/issues/119433#issuecomment-1326957279
  #  Mainly for flatpak
  #    1. bindfs resolves all symlink, 
  #    2. allowing all fonts to be accessed at `/usr/share/fonts`
  #    3. without letting /nix into the sandbox.
  #
  ###################################################################################

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
  
  services.flatpak.enable = true;
}