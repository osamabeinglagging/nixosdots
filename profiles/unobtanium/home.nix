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
  
#  gtk = {
#    enable = true;
#    theme = {
#      name = "Catppuccin-Mocha-Mauve";
#      package = (pkgs.catppuccin-gtk.override { accents = [ "mauve" ]; variant = "mocha"; });
#    };
#    cursorTheme = {
#      name = "Bibata-Modern-Ice";
#      package = pkgs.bibata-cursors;
#      size = 16;
#    };
#    iconTheme = {
#      name = "Adwaita";
#      package = pkgs.gnome.adwaita-icon-theme;
#    };
#  };

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
