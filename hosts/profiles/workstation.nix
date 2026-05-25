{ config, ... }: {
  imports = [
    ../../modules/common.nix
    ../../modules/apps/dev.nix
    ../../modules/apps/utilities.nix
    ../../modules/apps/video.nix
  ];
}
