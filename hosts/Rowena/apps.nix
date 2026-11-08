{ pkgs, lib, config, self, ... }:
{
    environment.defaultPackages = with pkgs; [];

    homebrew = {
        casks = [
            {
                name = "jellyfin";
            }
            {
                name = "transmission";
            }
        ];
    };

    # Automatically manage the Caddy reverse proxy daemon
    services.caddy = {
        enable = true;
        virtualHosts = {
            "jellyfin.enyutech.com".extraConfig = ''
                reverse_proxy 127.0.0.1:8096
            '';
            "torrent.enyutech.com".extraConfig = ''
                reverse_proxy 127.0.0.1:9091
            '';
        };
    };
}
