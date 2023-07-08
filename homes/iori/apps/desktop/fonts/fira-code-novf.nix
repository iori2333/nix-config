# FiraCode from https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/fonts/fira-code/default.nix
# Disabled variable fonts, as they are not supported by all applications yet.
{ lib, stdenvNoCC, fetchzip }:

stdenvNoCC.mkDerivation rec {
  pname = "fira-code-novf";
  version = "6.2";

  src = fetchzip {
    url = "https://github.com/tonsky/FiraCode/releases/download/${version}/Fira_Code_v${version}.zip";
    stripRoot = false;
    hash = "sha256-UHOwZL9WpCHk6vZaqI/XfkZogKgycs5lWg1p0XdQt0A=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 ttf/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/tonsky/FiraCode";
    description = "Monospace font with programming ligatures";
    longDescription = ''
      Fira Code is a monospace font extending the Fira Mono font with
      a set of ligatures for common programming multi-character
      combinations.
    '';
    license = licenses.ofl;
    maintainers = [ maintainers.rycee ];
    platforms = platforms.all;
  };
}