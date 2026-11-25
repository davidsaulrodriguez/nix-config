{ self, lib, ... }:
{
  system = {
    stateVersion = 6; # backwards compatibility
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  # Nix daemon and nix.conf are managed by the Determinate Nix installer
  nix.enable = false;

  power = {
    sleep = {
      computer = lib.mkDefault null; # Idle minutes until sleep (or "never")
      display = lib.mkDefault null;
      harddisk = lib.mkDefault null;
      allowSleepByPowerButton = lib.mkDefault null;
    };
  };

  programs = {
    zsh = {
      enable = lib.mkDefault true;
      enableAutosuggestions = lib.mkDefault false;
      enableFastSyntaxHighlighting = lib.mkDefault false;
      enableSyntaxHighlighting = lib.mkDefault false;
      histSize = lib.mkDefault 2000;
    };
  };

  security = {
    pam.services = {
      sudo_local = {
        enable = lib.mkDefault true; # Manage /etc/pam.d/sudo_local with nix-darwin
        touchIdAuth = lib.mkDefault true; # Enable Touch ID for sudo
        watchIdAuth = lib.mkDefault true; # Enable Apple Watch auth for sudo
      };
    };
  };
}