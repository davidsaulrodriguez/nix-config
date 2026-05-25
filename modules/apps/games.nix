{ pkgs, ... }:
{
    environment.defaultPackages = with pkgs; [
        luanti-client
    ];

    homebrew.masApps = {
#        "Apple Developer"   = 640199958;
    };
}
