{ pkgs, ... }:
{
    environment.defaultPackages = with pkgs; [
        luanti-server
    ];

    homebrew.masApps = {
#        "Apple Developer"   = 640199958;
    };
}
