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

      # davinci-resolve
      # obsidian

      (import ../scripts/pywal-reload.nix {inherit pkgs;})
    ];
  };

  imports = [
    ./programs/bat
    ./programs/fastfetch
    ./programs/fish
    ./programs/hyprshot
    ./programs/rmpc
    ( import ./programs/rofi { inherit config; } )
    ./programs/vesktop
    ./programs/yazi
    ./programs/zoxide
  ];

  programs = {
    kitty = {
      enable = true;
      extraConfig = ''
        include ~/.cache/wal/colors-kitty.conf
        background_opacity 0.7
      '';
      settings = {
        cursor_trail = 3;
        cursor_trail_decay = "0.1 0.4";
      };
      font = {
        name = "FantasqueSansM Nerd Font";
        size = 16;
        package = pkgs.nerd-fonts.fantasque-sans-mono;
      };
    };

    # rofi = {
    #   enable = true;
    #   font = "FantasqueSansM Nerd Font 12";
    #   theme = let
    #     mkLiteral = config.lib.formats.rasi.mkLiteral;
    #   in {
    #     "@import" = "${config.xdg.cacheHome}/wal/colors-rofi-dark.rasi";
    #     "window" = {
    #       anchor = mkLiteral "north";
    #       location = mkLiteral "north";
    #       width = mkLiteral "100%";
    #       padding = mkLiteral "4px";
    #       children = [
    #         "horibox"
    #       ];
    #     };
    #     "horibox" = {
    #       orientation = mkLiteral "horizontal";
    #       children = [
    #         "prompt"
    #         "entry"
    #         "listview"
    #       ];
    #     };
    #     "listview" = {
    #       layout = mkLiteral "horizontal";
    #       spacing = mkLiteral "5px";
    #       lines = mkLiteral "100";
    #     };
    #     "entry" = {
    #       expand = mkLiteral "false";
    #       width = mkLiteral "10em";
    #     };
    #     "element-text, element-icon" = {
    #       background-color = mkLiteral "inherit";
    #       text-color = mkLiteral "inherit";
    #     };
    #   };
    # };

    tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      terminal = "tmux-256color";

      prefix = "C-a";

      clock24 = true;
      escapeTime = 0;
      disableConfirmationPrompt = true;
      baseIndex = 1;
    };
  };

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
