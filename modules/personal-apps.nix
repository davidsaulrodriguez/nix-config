# modules/personal-apps.nix
{ pkgs, lib, config, ... }:

{
  # Enable Brew integration
  homebrew.enable = true;

  # Use the primary user (default in nix-darwin) [page:0]
  # homebrew.user = config.system.primaryUser;

  # Optional: where GUI apps should be installed
  homebrew.caskArgs.appdir = "~/Applications";

  # Taps if you need any (can be empty)
  homebrew.taps = [
    # "homebrew/cask"
    # "homebrew/cask-fonts"
  ];

  # Casks: personal GUI apps
  homebrew.casks = [
    # "rectangle"
    # "firefox"
    # "visual-studio-code"

  ];

  # Mac App Store apps (you need to be logged into MAS) [page:0]
  # Keys are names (freeform), values are MAS numeric IDs.
  homebrew.masApps = {
    Xcode = 497799835; # Xcode
    FinalCutPro = 424389933; # Final Cut Pro
    Tailscale = 1475387142; # Tailscale
  };

  # Optional: Homebrew behavior on activation [page:0]
  homebrew.onActivation = {
    autoUpdate = false;
    upgrade    = false;
    cleanup    = "none";  # or "uninstall" / "zap" when you trust config
  };
}
