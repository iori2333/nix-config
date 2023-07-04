{ lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix = {
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 1w";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "iori" ];
    };
  };
  nixpkgs.config.allowUnfree = lib.mkDefault false;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no"; # disable root login
      PasswordAuthentication = false; # disable password login
    };
    openFirewall = true;
  };
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    aria2
    git
    htop
    neofetch
    ntfs3g
    tmux
    gnumake
    gcc
    unar

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

  environment.variables.EDITOR = "vim";
  programs.zsh.enable = true;
  virtualisation.docker.enable = true;
}