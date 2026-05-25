{ pkgs, self, lib, config, ... }: {
  imports = [
    ./packages.nix
    ./settings.nix
  ];
}
