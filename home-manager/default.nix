{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "jandro";
    homeDirectory = "/home/jandro";
    stateVersion = "25.11";

    packages = [
      pkgs.pywal16
      pkgs.nerd-fonts.fantasque-sans-mono
      pkgs.vlc

      pkgs.obsidian

      pkgs.furnace

      pkgs.gimp

      pkgs.archipelago
      pkgs.steamtinkerlaunch
      pkgs.r2modman

      pkgs.renoise
    ];
  };

  imports = [
    ./programs/bat
    ./programs/fastfetch
    ./programs/fish
    ./programs/hyprshot
    (import ./programs/kitty {inherit pkgs;})
    (import ./programs/neovim {inherit pkgs;})
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
