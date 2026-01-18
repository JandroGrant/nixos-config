{config, ...}: {
  programs.rofi = {
    enable = true;
    font = "FantasqueSansM Nerd Font 12";
    theme = let
      mkLiteral = config.lib.formats.rasi.mkLiteral;
    in {
      "@import" = "${config.xdg.cacheHome}/wal/colors-rofi-dark.rasi";
      "window" = {
        anchor = mkLiteral "north";
        location = mkLiteral "north";
        width = mkLiteral "100%";
        padding = mkLiteral "4px";
        children = [
          "horibox"
        ];
      };
      "horibox" = {
        orientation = mkLiteral "horizontal";
        children = [
          "prompt"
          "entry"
          "listview"
        ];
      };
      "listview" = {
        layout = mkLiteral "horizontal";
        spacing = mkLiteral "5px";
        lines = mkLiteral "100";
      };
      "entry" = {
        expand = mkLiteral "false";
        width = mkLiteral "10em";
      };
      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
    };
  };
}
