{
  description = "Alejandra-Mandarina's Nixos Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    alejandra,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfreePredicate = (
        pkg:
          builtins.elem (pkg.pname or (builtins.parseDrvName pkg.name).name) [
            "obsidian"
            "renoise"
            "davinci-resolve"
          ]
      );
    };
  in {
    nixosConfigurations.mandarina = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        {
          environment.systemPackages = [alejandra.defaultPackage.x86_64-linux];
        }
      ];
    };

    homeConfigurations."jandro" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home-manager
      ];
    };
  };
}
