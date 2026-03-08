# modules/dev-tools.nix
{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # editors / IDE helpers
    vim

    # git and related
    git
    gh

    # web dev
    php
    composer

    # search & UX
    tree
  ];

  # Optional: dev fonts, etc.
  # fonts.packages = with pkgs; [ jetbrains-mono nerdfonts ];
}
