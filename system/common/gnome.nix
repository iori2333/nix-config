{ pkgs, ... }:

{
  imports = [
    ./base-desktop.nix
  ];

  programs.sway.enable = true;
  xdg.portal.wlr.enable = true;

  services.xserver = {
    enable = true;
    displayManager = {
      
      gdm = {
        enable = true;
        wayland = true;
      };
    };
    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };
  };

  environment.gnome.excludePackages = [
    pkgs.gnome.geary
    pkgs.gnome.totem
    pkgs.gnome.simple-scan
    pkgs.gnome.gnome-music
    pkgs.gnome.gnome-contacts
    pkgs.gnome.gnome-maps
    pkgs.gnome.gnome-remote-desktop
    pkgs.epiphany
  ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.gnome-shell-extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.transparent-top-bar
    gnomeExtensions.gsconnect
    gnomeExtensions.caffeine
    gnomeExtensions.just-perfection
    gnomeExtensions.bing-wallpaper-changer
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes-x
    papirus-icon-theme
    vimix-gtk-themes
    vimix-icon-theme
  ];
}