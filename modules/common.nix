# modules/common.nix
{ pkgs, self, lib, ... }: {
  # Enable Touch ID for sudo because typing passwords is inconvenient
  security.pam.services.sudo_local.touchIdAuth = true;

  # Disable Determinate Nix since I am using their installer
  nix.enable = false;

  # Shared system packages for all hosts.
  environment.systemPackages = with pkgs; [
    vim
    gnupg
    git
    pinentry_mac
  ];

  # Shared System Defaults for all hosts.
  system.defaults.dock = {
      autohide = lib.mkDefault true;
      tilesize = lib.mkDefault 64;
      mru-spaces = lib.mkDefault true;
    };

  # Flakes and new CLI
  nix.settings.experimental-features = "nix-command flakes";

  # Git revision for `darwin-version`
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Backwards compatibility
  system.stateVersion = 6;

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";
}
