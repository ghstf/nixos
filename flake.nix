{
  description = "ghost NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    proton-cli = {
      url = "github:roman-16/proton-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, proton-cli, ... }: {
    nixosConfigurations.ghost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit proton-cli; };
      modules = [
        ./system/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-bak";
          home-manager.extraSpecialArgs = { inherit proton-cli; };
          home-manager.users.dani = import ./home/default.nix;
        }
      ];
    };
  };
}
