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
    persistent-apps = [
        "/System/Library/CoreServices/Finder.app"
        "/Users/david/Applications/WebStorm.app"
        "/System/Applications/iPhone\ Mirroring.app"
        "/Applications/Xcode.app"
        "/System/Applications/Shortcuts.app"
        "/System/Applications/Utilities/Screen\ Sharing.app"
        "/Applications/iTerm.app"
        "/System/Applications/System\ Settings.app"
    ];
  };

  system.defaults.screencapture = {
    location = "~/Pictures/screenshots";
  };
}