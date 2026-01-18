{
  programs.fish = {
    enable = true;
    shellInit = "zoxide init fish | source";
    shellAliases = {
      v = "nvim";
      f = "yazi";
      ff = "fastfetch";
      ffrhea = "fastfetch --logo ~/images/hello-abq.png --logo-type kitty-direct --logo-width 20 --logo-height 20";
      ffmonday = "fastfetch --logo ~/images/monday.png --logo-type kitty-direct --logo-width 50 --logo-height 20";
    };
    interactiveShellInit = ''
             # Disable Greeting
      set -U fish_greeting
    '';
  };
}
