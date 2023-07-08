{ pkgs, inputs, ... }:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    
    ../common/system
    ../common/users/iori.nix

    ../common/apps/docker.nix
    ../common/apps/fcitx5.nix
    ../common/apps/pipewire.nix
    ../common/apps/flatpak.nix
    ../common/apps/zerotier.nix
    ../common/apps/v2ray.nix
  
    ../common/desktops/gnome.nix
  ];

  networking = {
    hostName = "mika";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  hardware = {
    opengl = {
      enable = true;
      extraPackages = [ pkgs.amdvlk ];
      driSupport = true;
    };
    bluetooth.enable = true;
  };

  environment.variables.AMD_VULKAN_ICD = "RADV";

  virtualisation.docker.storageDriver = "btrfs";

  system.stateVersion = "23.05";
}
