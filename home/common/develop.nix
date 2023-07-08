{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Iori Ichinose";
    userEmail = "milk.ichinose.iori@gmail.com";
  };

  home.packages = with pkgs; [
    cmake
    ninja
    llvmPackages_16.clang
    clang-tools_16
    rustup
    go
    # opam # opam monorepo doesn't work well on NixOS
    jdk
    python3
    docker-compose
    vscode
  ];
}