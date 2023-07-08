{ pkgs, config, ... }:
let ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users = {
    groups.iori = { };
    users.iori = {
      hashedPassword = "$y$j9T$IPpSSeYPUe8j.ESyQOG1y.$zowuJiexRO7uuX/q9M.lXuEchxVqERh8Ilc686AKLI8";
      home = "/home/iori";
      isNormalUser = true;
      description = "Iori Ichinose";
      extraGroups = [
        "iori"
        "wheel"
        "users"
      ] ++ ifExists [
        "networkmanager"
        "docker"
        "git"
      ];
      shell = pkgs.fish;
      packages = [ pkgs.home-manager ];
    };
  };
}