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

    local-flake = {
      url = ./neovim;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    alejandra,
    local-flake,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.mandarina = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        {
          environment.systemPackages = [alejandra.defaultPackage.x86_64-linux];
        }
        # home-manager.nixosModules.home-manager
        # {
        #   home-manager = {
        #     useGlobalPkgs = true;
        #     useUserPackages = true;
        #     users.jandro = import ./home-manager/home.nix;
        #     backupFileExtension = "backup";
        #     extraSpecialArgs = {
        #       inherit local-flake;
        #     };
        #   };
        # }
      ];
    };

    homeConfigurations."jandro" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home-manager/home.nix];
      extraSpecialArgs = {
        inherit local-flake;
      };
    };
  };
}
