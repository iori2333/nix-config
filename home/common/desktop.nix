{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qq
    firefox
    seafile-client
    yesplaymusic
    libreoffice
    qbittorrent
    jetbrains-toolbox
    thunderbird
    vlc
    handbrake
    timeshift
    telegram-desktop
  ];
}
