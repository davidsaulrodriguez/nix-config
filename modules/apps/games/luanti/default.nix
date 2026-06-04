{ pkgs, ... }:
{
    environment.defaultPackages = with pkgs; [
        luanti
    ];

    homebrew.masApps = {
#        "Apple Developer"   = 640199958;
    };
}
