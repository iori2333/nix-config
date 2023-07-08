{ pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./font-profiles.nix
  ];

  home.packages = with pkgs; [
    seafile-client
    libreoffice-qt
    qbittorrent
    thunderbird
    vlc
    telegram-desktop
    zotero
    remmina
    qq
  ];
}