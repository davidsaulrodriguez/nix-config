{ pkgs, lib, config, ... }:
{
  # Ensure the `mas` CLI is available whenever Homebrew management is active
  environment.systemPackages = lib.mkIf config.homebrew.enable [ pkgs.mas ];

  # Enable Brew integration
  homebrew = {
    enable = lib.mkDefault true;
    caskArgs.appdir = lib.mkDefault "/Applications";
    onActivation = {
      # Keep false with nix-homebrew: Homebrew itself is pinned in flake.lock, and
      # brew's internal auto-update re-exec strips Nix/Homebrew paths needed by `mas`.
      autoUpdate = lib.mkDefault false;
      upgrade = lib.mkDefault true;
      cleanup = lib.mkDefault "uninstall"; # change to "zap" to also remove app data
    };
    enableZshIntegration = lib.mkDefault true;
    enableBashIntegration = lib.mkDefault false;
    enableFishIntegration = lib.mkDefault false;
  };

  nix-homebrew = {
    enable = lib.mkDefault true;
    mutableTaps = lib.mkDefault true;
    autoMigrate = lib.mkDefault false;
  };
}
