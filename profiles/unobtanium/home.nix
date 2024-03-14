{config, pkgs, ...}:{
  imports = [
    ../../configs/kitty.nix
    ../../configs/hyprland.nix
    ../../configs/nvim.nix
    ../../configs/waybar.nix
    ../../configs/rofi.nix
  ];
  home.username = "liquid";
  home.homeDirectory = "/home/liquid";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    python3
    kitty-themes
    (nerdfonts.override {fonts = ["RobotoMono"];})
    hyprpicker
    git
    gh
    brave
    gcc
    jetbrains.idea-community
    vlc
#    jdk8
    jdk17
    wl-clipboard
    pulseaudio
    sway
  ] ++
    (with python3Packages; [
      pynput
    ]
  );
}
