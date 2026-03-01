{
  description = "David's nix-darwin configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... }: {
    darwinConfigurations = {
      # main laptop (MacBook Pro M2 Max; 96GB RAM, 2TB Storage)
      "Davids-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/Davids-MacBook-Pro.nix
          { _module.args.self = self; }  # so modules can use `self`
        ];
      };

      # later, add more hosts:
      # "Work-Mac" = nix-darwin.lib.darwinSystem {
      #   system = "aarch64-darwin";
      #   modules = [ ./hosts/Work-Mac.nix { _module.args.self = self; } ];
      # };
    };
  };
}
