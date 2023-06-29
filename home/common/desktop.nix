{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # qq
    firefox
    seafile-client
    yesplaymusic
    libreoffice-qt
    qbittorrent
    thunderbird
    vlc
    handbrake
    telegram-desktop
  ];
}
