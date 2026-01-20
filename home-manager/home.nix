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
      pywalfox-native
      nerd-fonts.fantasque-sans-mono
      vlc

      davinci-resolve
      obsidian
    ];
  };

  imports = [
    ./programs/bat
    ./programs/fastfetch
    ./programs/fish
    ./programs/hyprshot
    (import ./programs/kitty {inherit pkgs;})
    ./programs/rmpc
    (import ./programs/rofi {inherit config;})
    ./programs/vesktop
    ./programs/yazi
    ./programs/zoxide

    ./programs/hyprland
    ./programs/waybar
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
