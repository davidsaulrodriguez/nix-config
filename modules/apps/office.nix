{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    google-chrome
  ];

  homebrew.masApps = {
    "Pages: Create Documents"       = 361309726;
    "Numbers: Make Spreadsheets"    = 361304891;
    "Keynote: Design Presentations" = 361285480;
  };
}
