{
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 4;
        reload_style_on_change = true;

        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = [
          "mpd"
          "custom/separator"
          "tray"
          "custom/separator"
          "clock"
        ];

        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };
        "hyprland/window" = {
          max-length = 64;
        };
        "mpd" = {
          format = ''{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon} {artist} - {album} - {title} │ ({elapsedTime:%M:%S}/{totalTime:%M:%S})  '';
          format-disconnected = "Disconnected  ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped  ";
          intervale = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            on = "<span color=\"#f53c3c\"> </span>";
            off = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = " ";
          };
          state-icons = {
            paused = " ";
            playing = " ";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };

        clock = {
          format = "{:%c}";
          interval = 1;
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small><{calendar}</small></tt>";
        };
      };
    };

    style = ./style.css;
  };
}
