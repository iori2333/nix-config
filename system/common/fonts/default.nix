{ pkgs, ... }:

{
    fonts = {
    fontDir.enable = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      material-design-icons

      noto-fonts
      noto-fonts-emoji

      source-sans
      source-serif
      source-han-sans
      source-han-serif
      source-han-mono
      wqy_microhei

      fira-code
      jetbrains-mono
      cascadia-code
      iosevka

      (nerdfonts.override { fonts = [ "FiraCode" ]; })

      (pkgs.callPackage ./harmonyos-sans.nix { })
    ];

    fontconfig.defaultFonts = {
      serif = [ "Source Han Serif" ];
      sansSerif = [ "Source Han Sans" ];
      monospace = [ "FiraCode Nerd Font" "Source Han Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}