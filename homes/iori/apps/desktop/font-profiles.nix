{ pkgs, ... }:
let
  fira-code = pkgs.callPackage ./fonts/fira-code-novf.nix {};
  harmonyos-sans = pkgs.callPackage ./fonts/harmonyos-sans.nix {};
  noto-fonts-cjk = pkgs.callPackage ./fonts/noto-fonts-cjk-novf.nix {};
in {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "Iosevka Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; };
    };
    sans = {
      family = "思源黑体";
      package = pkgs.source-han-sans;
    };
    serif = {
      family = "思源宋体";
      package = pkgs.source-han-serif;
    };
    emoji = {
      family = "Noto Color Emoji";
      package = pkgs.noto-fonts-emoji;
    };
    additionalPackages = [
      fira-code
      harmonyos-sans
      noto-fonts-cjk.sans
      noto-fonts-cjk.serif
    ] ++ (with pkgs; [
      iosevka
      jetbrains-mono
      cascadia-code
    ]);
  };
}