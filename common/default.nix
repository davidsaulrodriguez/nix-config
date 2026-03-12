# modules/common/common.nix
{ pkgs, self, lib, ... }: {
  imports = [
    ./default-dock.nix
    ./system-packages.nix
    ./system-settings.nix
  ];

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.buildPlatform = "aarch64-darwin";
}