{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        source = "/home/jandro/images/hello-abq.png";
        width = 18;
        height = 13;
        padding = {
          top = 1;
          right = 2;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "wm"
        "theme"
        "terminal"
        "terminalfont"
        "memory"
        "colors"
      ];
    };
  };
}
