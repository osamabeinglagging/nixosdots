{pkgs, config, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      bind = [
        "SUPER, Q, exec, kitty"
        "SUPER, C, killactive"
        "SUPER, V, togglefloating"
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER, space, exec, pkill rofi || rofi -show drun"
        "SUPER SHIFT, s, exec, grim -g \"$(slurp -d)\" - | wl-copy"
        ", Print, exec, grim - | wl-copy"
      ] ++ (
        builtins.concatLists(builtins.genList(
          x: let
            ws = let
              c = (x + 1) / 10;
            in 
              builtins.toString(x + 1- (c * 10));
          in[
            "SUPER, ${ws}, workspace, ${toString(x + 1)}"
            "SUPER SHIFT, ${ws}, movetoworkspace, ${toString(x + 1)}"
          ]
        ) 10)
      );

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizeWindow"
      ];

      monitor = ",1440x900,0x0,1";
      
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        force_no_accel = 1;
      };

      general = {
        gaps_in = 5;
        gaps_out = 2;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = ["myBezier, 0.05, 0.9, 0.1, 1.05"];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      exec-once = [
        "swww init & swww img \"../wallpapers/landscape.png\""
        "sleep 5; waybar"
      ];
    };
  };
}
