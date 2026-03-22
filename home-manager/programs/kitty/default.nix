{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
      background_opacity 0.5
    '';
    settings = {
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
    };
    font = {
      name = "ProggyCleanTT";
      size = 24;
      package = pkgs.proggyfonts;
    };
  };
}
