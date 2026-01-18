{
  config,
  pkgs,
  local-flake,
  ...
}: let
  font = "FantasqueSansM";
in {
  home = {
    username = "jandro";
    homeDirectory = "/home/jandro";
    stateVersion = "25.11";

    packages = with pkgs; [
      local-flake.packages.x86_64-linux.default
      pywal16
      nerd-fonts.fantasque-sans-mono
      vlc

      davinci-resolve
      obsidian

      (import ../scripts/pywal-reload.nix {inherit pkgs;})
    ];
  };

  imports = [
    ./programs/bat
    ./programs/fastfetch
    ./programs/fish
    ./programs/hyprshot
    ( import ./programs/kitty { inherit pkgs; } )
    ./programs/rmpc
    ( import ./programs/rofi { inherit config; } )
    ./programs/vesktop
    ./programs/yazi
  ];

  services = {
    blanket = {
      enable = true;
    };

    dunst = {
      enable = true;
    };

    mpd = {
      enable = true;
      musicDirectory = "/home/jandro/music";
    };

    swww = {
      enable = true;
    };
  };

  programs.home-manager.enable = true;
}
