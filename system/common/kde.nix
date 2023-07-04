{ lib, pkgs, config, ... }:

{
  imports = [
    ./base-desktop.nix
  ];

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    oxygen
    khelpcenter
    print-manager
  ];

  environment.systemPackages = with pkgs.libsForQt5; [
    ark
    discover
    kate
    packagekit-qt
    filelight
  ];

  services.packagekit.enable = true;

  # Fix fcitx5 on wayland session https://github.com/NixOS/nixpkgs/issues/129442
  environment.sessionVariables = {
    NIX_PROFILES =
      "${lib.concatStringsSep " " (lib.reverseList config.environment.profiles)}";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;
}