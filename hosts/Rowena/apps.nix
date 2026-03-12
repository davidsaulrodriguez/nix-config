{ pkgs, lib, config, ... }:
{
    environment.defaultPackages = with pkgs; [];

    homebrew = {
        casks = [
            {
                name = "jellyfin";
            }
        ];
    };
}
