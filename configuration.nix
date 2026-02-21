{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./steamdrive.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos-mandarina";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Los_Angeles";

  # nvidia fixes

  nixpkgs.config.allowUnfree = true;

  hardware = {
    graphics = {
      enable = true;
    };

    nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver.videoDrivers = ["nvidia"];

  # nvidia fixes end

  users.users.jandro = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = [];
    shell = pkgs.fish;
  };

  programs = {
    firefox.enable = true;

    steam = {
      enable = true;
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    fish = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git

    kitty
    waybar

    tree

    xwayland-satellite
  ];

  # allow running appimages and the like
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # add any missing dynamic libraries for unpackaged
      # programs here, NOT in environment.systemPackages
    ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11"; # Did you read the comment?
}
