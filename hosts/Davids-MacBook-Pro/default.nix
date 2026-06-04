{ pkgs, self, lib, config, ... }:
{
    imports = [
        ../profiles/workstation.nix
        ../../modules/apps/games/luanti/default.nix
        ./personal-dock.nix # Include my personalized dock
        ./system-settings.nix # Include my personalized system setting overrides
    ];

    # Allow non-free packages
    nixpkgs.config.allowUnfree = true;

    # Full nix-homebrew management
    nix-homebrew = {
        user = "david";
        autoMigrate = true;  # Migrates manual installs to nix-declared
    };
}