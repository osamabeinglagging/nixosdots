{
  description = "Flakefuc";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.unobtanium = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [
        ./profiles/unobtanium/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.users.liquid = import ./profiles/unobtanium/home.nix;
        }
      ];
    };
  };
}
