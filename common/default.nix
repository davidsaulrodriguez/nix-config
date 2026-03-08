# modules/common/common.nix
{ pkgs, self, lib, ... }: {
  imports = [
    ./default-dock.nix
    ./systemPackages.nix
  ];
  # Enable Touch ID for sudo because typing passwords is inconvenient
  security.pam.services.sudo_local.touchIdAuth = true;

  # Disable Determinate Nix since I am using their installer
  nix.enable = false;

  # Flakes and new CLI
  nix.settings.experimental-features = "nix-command flakes";

  # Git revision for `common-version`
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Backwards compatibility
  system.stateVersion = 6;

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.buildPlatform = "aarch64-darwin";
}