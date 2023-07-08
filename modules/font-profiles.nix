{ lib, config, ... }:
let
  mkFontOption = kind: {
    family = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = "Family name for ${kind} font profile";
      example = "Fira Code";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = null;
      description = "Package for ${kind} font profile";
      example = "pkgs.fira-code";
    };
  };
  cfg = config.fontProfiles;
in {
  options.fontProfiles = {
    enable = lib.mkEnableOption "Whether to enable font profiles";
    monospace = mkFontOption "monospace";
    sans = mkFontOption "sans";
    serif = mkFontOption "serif";
    emoji = mkFontOption "emoji";
    additionalPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "Additional packages to install";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig = {
      enable = true;
      # default fonts not supported yet
      # defaultFonts = {
      #   serif = [ cfg.serif.family cfg.emoji.family ];
      #   sansSerif = [ cfg.sans.family cfg.emoji.family ];
      #   monospace = [ cfg.monospace.family cfg.emoji.family ];
      #   emoji = [ cfg.emoji.family ];
      # };
    };
    home.packages = [
      cfg.monospace.package
      cfg.sans.package
      cfg.serif.package
      cfg.emoji.package
    ] ++ cfg.additionalPackages;
  };
}