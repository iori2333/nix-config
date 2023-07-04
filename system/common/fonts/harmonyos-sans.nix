{ lib, stdenvNoCC, fetchzip }:

stdenvNoCC.mkDerivation rec {
  pname = "harmonyos-sans";
  version = "1.0";

  src = fetchzip {
    url = "https://developer.harmonyos.com/resource/image/design/resource/download/general/HarmonyOS-Sans.zip";
    stripRoot = false;
    hash = "sha256-c10AIlce3WSqzKI9cq9LoobRJHgbqnzBo/d958Acz/A=";
  };

  # only extract the variable font because everything else is a duplicate
  installPhase = ''
    runHook preInstall

    install -Dm644 'HarmonyOS Sans'/HarmonyOS_Sans*/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://developer.harmonyos.com/cn/design/resource";
    description = "HarmonyOS Sans font";
    longDescription = ''
      HarmonyOS Sans font
    '';
    platforms = platforms.all;
  };
}