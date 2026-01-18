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

      ( import ../scripts/pywal-reload.nix { inherit pkgs; } )
    ];
  };

  imports = [
    ./programs/bat
  ];

  programs = {

    fastfetch = {
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

    fish = {
      enable = true;
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

    hyprshot = {
      enable = true;
    };

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

    rmpc = {
      enable = true;
    };

    rofi = {
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

    vesktop = {
      enable = true;
    };

    yazi = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
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
