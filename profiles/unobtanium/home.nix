{config, pkgs, ...}:{
  imports = [
    ../../configs/kitty.nix
    ../../configs/hyprland.nix
    ../../configs/neovim.nix
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

  xdg.portal = {
    enable = true;
    config = {common = {default = ["gtk"]; }; };
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };

  gtk = {
    enable = true;
    theme = {
      package = (pkgs.catppuccin-gtk.override { accents = [ "mauve" ]; variant = "mocha"; });
      name = "Catppuccin-Mocha-Mauve";
    };
   iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
  };

  home.packages = with pkgs; [
    python3
    vscode
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
    grim slurp
    light
    nodejs
  ] ++
    (with python3Packages; [
      pynput
    ]
  );
  nixpkgs.config.allowUnfree = true;
}
