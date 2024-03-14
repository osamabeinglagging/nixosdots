# tompo rice
{ pkgs, config, ... }: {
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "bottom";
      mod = "dock";
      height = 31;
      exclusive = true;
      passthrough = false;
      gtk-layer-shell = true;

      modules-left = [ "custom/padd" "custom/l_end" "custom/power" "custom/r_end" "custom/l_end" "wlr/taskbar" "custom/r_end"];
      modules-center = [ "custom/l_end" "clock" "custom/r_end"];
      modules-right = [ "custom/l_end" "network" "pulseaudio" "custom/r_end" "custom/padd" ];

      "custom/power" = {
          format = " ";
          exec = "echo ; echo Shutdown";
          on-click = "shutdown -h now";
          interval = 86400;
          tooltip = true;
      };

      "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 18;
          icon-theme = "Tela-circle-dracula";
          spacing = 0;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
      };

      clock = {
          format = "{: %I:%M}";
          format-alt = "{:󰃭 %d·%m·%y}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
              mode = "month";
              mode-mon-col = 3;
              on-scroll = 1;
              on-click-right = "mode";
              format = {
                  months = "<span color='#ffead3'><b>{}</b></span>";
                  weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                  today = "<span color='#ff6699'><b>{}</b></span>";
              };
          };
          actions = {
              on-click-right = "mode";
              on-click-forward = "tz_up";
              on-click-backward = "tz_down";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
          };
      };

      network = {
          format-ethernet = "󱘖  Wired";
          tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󱘖 {ifname} (No IP)";
          format-disconnected = " Disconnected";
      };

      pulseaudio = {
          scroll-step = 10;
          format = "{icon} {volume}";
          format-muted = "󰟎 0";
          on-click = "pavucontrol -t 3";
          tooltip-format = "{icon} {desc} // {volume}%";
          format-icons = {
              headset = "󰋋 ";
          };
      };

      "custom/l_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
      };

      "custom/r_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
      };

      "custom/padd" = {
          format = "  ";
          interval = "once";
          tooltip = false;
      };
    }];

    style = 
      ''
      * {
        border: none;
        border-radius: 0px;
        font-family: RobotoMono;
        font-weight: bold;
        font-size: 12px;
        min-height: 10px;
      }

      @define-color bar-bg rgba(0, 0, 0, 0);

      @define-color main-bg #11111b;
      @define-color main-fg #cdd6f4;

      @define-color wb-act-bg #a6adc8;
      @define-color wb-act-fg #313244;

      @define-color wb-hvr-bg #f5c2e7;
      @define-color wb-hvr-fg #313244;

      window#waybar {
          background: @bar-bg;
      }

      tooltip {
          background: @main-bg;
          color: @main-fg;
          border-radius: 8px;
          border-width: 0px;
      }

      #workspaces button {
          box-shadow: none;
          text-shadow: none;
          padding: 0px;
          border-radius: 9px;
          margin-top: 3px;
          margin-bottom: 3px;
          padding-left: 3px;
          padding-right: 3px;
          color: @main-fg;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #workspaces button.active {
          background: @wb-act-bg;
          color: @wb-act-fg;
          margin-left: 3px;
          padding-left: 12px;
          padding-right: 12px;
          margin-right: 3px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #workspaces button:hover {
          background: @wb-hvr-bg;
          color: @wb-hvr-fg;
          padding-left: 3px;
          padding-right: 3px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #taskbar button {
          box-shadow: none;
	        text-shadow: none;
          padding: 0px;
          border-radius: 9px;
          margin-top: 3px;
          margin-bottom: 3px;
          padding-left: 3px;
          padding-right: 3px;
          color: @wb-color;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #taskbar button.active {
          background: @wb-act-bg;
          color: @wb-act-color;
          margin-left: 3px;
          padding-left: 12px;
          padding-right: 12px;
          margin-right: 3px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #taskbar button:hover {
          background: @wb-hvr-bg;
          color: @wb-hvr-color;
          padding-left: 3px;
          padding-right: 3px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #clock,
      #network,
      #custom-power,
      #pulseaudio,
      #taskbar,
      #window,
      #workspaces,
      #custom-l_end,
      #custom-r_end {
          color: @main-fg;
          background: @main-bg;
          opacity: 1;
          margin: 4px 0px 4px 0px;
          padding-left: 4px;
          padding-right: 4px;
      }

      #workspaces,
      #taskbar {
          padding: 0px;
      }

      #custom-r_end {
          border-radius: 0px 22px 22px 0px;
          margin-right: 9px;
          padding-right: 3px;
      }

      #custom-l_end {
          border-radius: 22px 0px 0px 22px;
          margin-left: 9px;
          padding-left: 3px;
      }
      '';
    };
  }
