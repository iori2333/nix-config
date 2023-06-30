{ pkgs, ... }:

{
  users.groups = {
    iori = { };
    docker = { };
  };
  users.users.iori = {
    hashedPassword = "$y$j9T$IPpSSeYPUe8j.ESyQOG1y.$zowuJiexRO7uuX/q9M.lXuEchxVqERh8Ilc686AKLI8";
    home = "/home/iori";
    isNormalUser = true;
    description = "Iori Ichinose";
    extraGroups = [ "iori" "users" "networkmanager" "sudo" "wheel" "docker" ];
    shell = pkgs.zsh;
  };
}