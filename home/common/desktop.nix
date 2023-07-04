{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    seafile-client
    libreoffice-qt
    qbittorrent
    thunderbird
    vlc
    telegram-desktop
    zotero
    remmina
    freerdp
  ];
}