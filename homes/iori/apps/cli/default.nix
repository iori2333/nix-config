{ pkgs, ... }:

{
  imports = [
    ./vim.nix
  ];

  home.packages = with pkgs; [
    tmux
    neofetch
    htop
    curl
    wget

    (
      let base = pkgs.appimageTools.defaultFhsEnvArgs; in
      pkgs.buildFHSUserEnv (base // {
        name = "fhs";
        targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [ pkgs.pkg-config ];
        profile = "export FHS=1";
        runScript = "bash";
        extraOutputsToInstall = [ "dev" ];
      })
    )
  ];
}