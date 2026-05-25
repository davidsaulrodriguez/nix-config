{ pkgs, ... }:
{
    environment.defaultPackages = with pkgs; [
        ffmpeg
        yt-dlp
    ];

    homebrew.masApps = {
        "Final Cut Pro" = 424389933;
        "Compressor"    = 424390742;
        "Motion"        = 434290957;
    };
}
