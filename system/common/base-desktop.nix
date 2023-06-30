{ lib, pkgs, ... }:

{
  imports = [
    ./base-server.nix
    ./modules/input.nix
  ];

  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      material-design-icons

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra

      source-sans
      source-serif
      source-han-sans
      source-han-serif

      fira-code
      jetbrains-mono

      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })

      (pkgs.callPackage ../../fonts/harmonyos-sans.nix { })
    ];

    fontconfig.defaultFonts = {
      serif = [ "Source Han Serif" "Noto Color Emoji" ];
      sansSerif = [ "Source Han Sans" "Noto Color Emoji" ];
      monospace = [ "FiraCode Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # dconf is a low-level configuration system.
  programs.dconf.enable = true;
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-kde
    ];
  };

  services.colord.enable = true;
  services.geoclue2.enable = true;
}