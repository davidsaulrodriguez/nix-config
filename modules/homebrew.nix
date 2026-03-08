{ pkgs, lib, config, nix-homebrew, ... }:
{
  # Enable Brew integration
  homebrew = lib.mkDefault {
    enable = true;
    caskArgs.appdir = "/Applications/Homebrew\ Apps";
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";  # Removes undeclared brews/casks
    };
    taps = [];
    brews = [];
    casks = [];
    masApps = {};
  };

  nix-homebrew = lib.mkDefault {
    autoMigrate = false;
  };
}
