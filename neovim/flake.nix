{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    neovim = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    neovim,
  }: let
    overlayFlakeInputs = prev: final: {
      neovim = neovim.packages.x86_64-linux.neovim;
    };

    overlayWrappedNeovim = prev: final: {
      wrappedNeovim = import ./neovimWrapper.nix {
        pkgs = final;
      };
    };

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [overlayFlakeInputs overlayWrappedNeovim];
    };
  in {
    packages.x86_64-linux.default = pkgs.wrappedNeovim;
    apps.x86_64-linux.default = {
      type = "app";
      program = "${pkgs.wrappedNeovim}/bin/nvim";
    };
  };
}
