{config, pkgs, ...}:{
  imports = [
    ../../configs/hyprland.nix
    ../../configs/nvim.nix
  ];
  home.username = "liquid";
  home.homeDirectory = "/home/liquid";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    kitty
    git
    gh
    brave
    gcc
    jetbrains.idea-community
    vlc
#    jdk8
    jdk17
  ];
}
