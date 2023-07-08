{ pkgs, ... }:

{
  imports = [ ./fonts.nix ];

  services.xserver = {
    enable = true;
    displayManager.gdm = {
        enable = true;
        wayland = true;
    };
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    epiphany
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    geary
    totem
    simple-scan
    gnome-contacts
    gnome-characters
    gnome-maps
    gnome-music
    gnome-remote-desktop
    tali
    iagno
    hitori
    atomix
  ]);

  environment.systemPackages = (with pkgs; [
    papirus-icon-theme
    vimix-gtk-themes
    vimix-icon-theme
  ]) ++ (with pkgs.gnome; [
    gnome-tweaks
    gnome-shell-extensions
    gnome-settings-daemon
  ]) ++ (with pkgs.gnomeExtensions; [
    dash-to-dock
    appindicator
    rounded-window-corners
    transparent-top-bar
    gsconnect
    caffeine
    just-perfection
    bing-wallpaper-changer
    blur-my-shell
    user-themes-x
  ]);
}