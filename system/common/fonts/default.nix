{ pkgs, ... }:

let
  harmonyos-sans = pkgs.callPackage ./harmonyos-sans.nix { };
  # use customized noto-fonts-cjk to avoid using variable fonts
  noto-fonts-cjk-novf = pkgs.callPackage ./noto-fonts-cjk-novf.nix { };
in {
    fonts = {
    fontDir.enable = true;
    enableDefaultFonts = true;

    fonts = with pkgs; [
      material-design-icons

      noto-fonts
      noto-fonts-emoji

      fira-code
      jetbrains-mono
      cascadia-code
      iosevka

      (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })

      harmonyos-sans
      noto-fonts-cjk-novf.sans
      noto-fonts-cjk-novf.serif
      wqy_microhei
    ];

    # use chinese fonts as default for CJK support
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
      monospace = [ "Iosevka Nerd Font" "Noto Sans CJK SC" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}