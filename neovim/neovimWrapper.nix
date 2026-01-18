{pkgs}: let
  plugins = import ./plugins.nix {inherit pkgs;};
in
  pkgs.wrapNeovim pkgs.neovim {
    configure = {
      packages.all.start = plugins;
    };
  }
