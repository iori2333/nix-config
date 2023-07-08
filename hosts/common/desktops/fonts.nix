{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = false;
    fontDir.enable = true;
    fonts = with pkgs; [
      source-han-sans
      source-han-serif
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
    ];
    fontconfig.defaultFonts = {
      serif = [ "Source Han Serif SC" "Noto Color Emoji" ];
      sansSerif = [ "Source Han Sans SC" "Noto Color Emoji" ];
      monospace = [ "Iosevka" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}