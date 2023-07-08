{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.hyprland.homeManagerModules.default
    # Application configs
    ./gammastep.nix
    ./kitty.nix
    ./mako.nix
    ./swaylock.nix
    ./waybar.nix
    ./wezterm.nix
    ./wofi.nix
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
  };

  home.packages = with pkgs; [
    inputs.hyprwm-contrib.packages.${system}.grimblast
    swaybg
    swayidle
    networkmanagerapplet
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = let
      home = config.home;
      colorscheme = config.colorscheme;
    in import ./hyprland.nix { inherit home colorscheme; };
  };
}