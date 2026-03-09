{ pkgs, lib, config, ... }:
{
    environment.defaultPackages = with pkgs; [
        jellyfin
      ];
}
