{ pkgs, self, lib, ... }: {
    imports = [
        ./default-dock.nix
        ./homebrew.nix
        ./apps/default.nix
        ./system/base.nix
    ];

    # Platform
    nixpkgs.hostPlatform = "aarch64-darwin";
    nixpkgs.buildPlatform = "aarch64-darwin";
}