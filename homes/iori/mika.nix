{ inputs, ... }:
let colorschemes = inputs.nix-colors.colorSchemes;
in {
  imports = [
    ./common
    ./apps/cli
    ./apps/desktop
    # ./apps/hyprland
    ./development
  ];

  colorscheme = colorschemes.catppuccin-macchiato;
}
