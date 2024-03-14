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
  
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = (pkgs.catppuccin-gtk.override { accents = [ "mauve" ]; variant = "mocha"; });
      name = "Catppuccin-Mocha-Mauve";
    };
#    cursorTheme = {
#      name = "Bibata-Modern-Ice";
#      package = pkgs.bibata-cursors;
#      size = 16;
#    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
  };

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
    swww
  ] ++
    (with python3Packages; [
      pynput
    ]
  );
}
