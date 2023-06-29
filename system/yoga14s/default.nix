{ pkgs, config, ... } @ args:

{
  imports = [
    ./hardware-configuration.nix
    ../common/kde.nix
    ../common/modules/users.nix
    ../common/modules/flatpak.nix
    ../common/modules/vms.nix
    ../common/modules/v2ray.nix
    ../common/modules/zerotier.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "iori-yoga14s";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  hardware.opengl.extraPackages = [
    pkgs.amdvlk
  ];
  environment.variables.AMD_VULKAN_ICD = "RADV";

  virtualisation.docker.storageDriver = "btrfs";

  system.stateVersion = "23.05";
  services.zerotierone.joinNetworks = [
    "a09acf023378ea18"
  ];
}