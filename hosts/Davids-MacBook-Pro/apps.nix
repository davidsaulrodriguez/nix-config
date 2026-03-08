{ pkgs, lib, config, ... }:
{
    environment.defaultPackages = with pkgs; [
        mas
        tree
        jetbrains.phpstorm
        jetbrains.webstorm
      ];
}
