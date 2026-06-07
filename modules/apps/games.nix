{ pkgs, ... }:
{
    environment.defaultPackages = with pkgs; [
        luanti
    ];

    homebrew.masApps = {
        "Grid Legends" = 1636273501;
    };
}
