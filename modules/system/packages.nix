{ pkgs, self, lib, config, ... }: {
  # Shared system packages for all hosts.
  environment.systemPackages = with pkgs; [
    vim
    gnupg
    git
    pinentry_mac
  ];
}