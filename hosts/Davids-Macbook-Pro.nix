# hosts/Davids-MacBook-Pro.nix
{ pkgs, self, lib, ... }: {
  imports = [
    ../modules/common.nix
  ];

  # Anything specific to this Mac goes here, for example:
  networking.hostName = "Davids-MacBook-Pro";

  # Host specific System Default settings
  system.primaryUser = "david";

  system.defaults.dock = {
    autohide = false;
    tilesize = 48;
    mru-spaces = false;
  };

  system.defaults.screencapture = {
    location = "~/Pictures/screenshots";
  };
}