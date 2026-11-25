{ ... }:
{
  imports = [
    ../../modules/common.nix
    ./apps.nix
    ./system-settings.nix
  ];

  # Full nix-homebrew management
  nix-homebrew = {
    user = "david";
    autoMigrate = true; # Migrates manual installs to nix-declared
  };

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "Rowena";

  # Host-specific system default settings
  system.primaryUser = "david";

  # Store screenshots away from Desktop
  system.defaults.screencapture = {
    location = "~/Pictures/screenshots";
  };
}