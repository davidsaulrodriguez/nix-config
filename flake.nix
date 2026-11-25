{
  description = "David's nix-darwin configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = { self, nix-darwin, nix-homebrew, ... }: {
    darwinConfigurations = {
      # Main laptop (MacBook Pro M2 Max; 96GB RAM, 2TB Storage)
      "Davids-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self; };
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          ./hosts/Davids-MacBook-Pro/default.nix
        ];
      };

      "Rowena" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self; };
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          ./hosts/Rowena/default.nix
        ];
      };
    };
  };
}