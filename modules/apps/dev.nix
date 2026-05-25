{ pkgs, ... }:
{
    environment.defaultPackages = with pkgs; [
        mas
        tree
        jetbrains.phpstorm
        jetbrains.webstorm
    ];

    homebrew.masApps = {
        "Apple Developer"   = 640199958;
        "Swift Playgrounds" = 1496833156;
        "Transporter"       = 1450874784;
        "TestFlight"        = 899247664;
        "Headrest"          = 6444033141;
    };
}
