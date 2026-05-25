{ config, pkgs, lib, ... }:
let
    inherit (lib) mkMerge mkIf;
in
{
    imports = [
        ./office.nix # Import office suite by default
        ./utilities.nix # Import helpful utility applications
    ];
}