{
  description = "David's nix-common configs";

  inputs = let version = "25.11"; in {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-${version}-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-${version}";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Add nix-homebrew
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
#    nix-homebrew.inputs.nixpkgs.follows = "nixpkgs";

    # Define specific taps as flake inputs
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-core.flake = false;
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-cask.flake = false;
  };

  outputs = inputs@{ self, nix-darwin, nix-homebrew, nixpkgs, ... }: {
    darwinConfigurations = {
      # main laptop (MacBook Pro M2 Max; 96GB RAM, 2TB Storage)
      "Davids-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          # nix-homebrew system module (bootstraps Homebrew if missing)
          nix-homebrew.darwinModules.nix-homebrew

          ./hosts/Davids-MacBook-Pro/default.nix

          { _module.args.self = self; }  # so modules can use `self`
        ];
      };

      # later, add more hosts:
      # "Work-Mac" = nix-common.lib.darwinSystem {
      #   system = "aarch64-common";
      #   modules = [ ./hosts/Work-Mac.nix { _module.args.self = self; } ];
      # };
    };
  };
}
