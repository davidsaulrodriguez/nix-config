{ pkgs, self, lib, ... }:
{
    imports = [
        ./apps.nix
        ../../modules/common.nix
        ../../modules/homebrew.nix
    ];

    # Full nix-homebrew management
    nix-homebrew = {
        user = "david";
        autoMigrate = true;  # Migrates manual installs to nix-declared
    };

    nixpkgs.config.allowUnfree = true;

    # Anything specific to this Mac goes here, for example:
    networking.hostName = "Rowena";

    # Host specific System Default settings
    system.primaryUser = "david";

    # Where screenshots will live when taken because the desktop by default is insane!
    system.defaults.screencapture = {
        location = "~/Pictures/screenshots";
    };
}