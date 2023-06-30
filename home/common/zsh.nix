{ pkgs, ... }:

{
  programs.command-not-found.enable = true;
  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "command-not-found"
      ];
      theme = "agnoster";
    };
  };
}