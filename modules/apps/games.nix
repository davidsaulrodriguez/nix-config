{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    luanti
  ];

  homebrew.masApps = {
    "Grid Legends" = 1636273501;
  };
}
