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
      sddm.enable = true;
    };
    desktopManager = {
      xterm.enable = false;
      plasma5.enable = true;
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    oxygen
    khelpcenter
    print-manager
  ];

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    vimix-gtk-themes
    vimix-icon-theme
    ark
    discover
    libsForQt5.packagekit-qt
  ];

  services.packagekit.enable = true;
}
