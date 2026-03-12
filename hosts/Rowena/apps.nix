{ pkgs, lib, config, self, ... }:
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
