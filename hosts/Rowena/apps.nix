{ pkgs, lib, config, self, ... }:
let
  # Build a declarative Caddyfile text asset with correct subdomains
  caddyfile = pkgs.writeText "Caddyfile" ''
    jellyfin.enyutech.com {
        reverse_proxy 127.0.0.1:8096
        tls {
            # Let Caddy pull the Let's Encrypt certs through your running Tailscale engine
            get_certificate tailscale
        }
    }

    transmission.enyutech.com {
        reverse_proxy 127.0.0.1:9091
        tls {
            get_certificate tailscale
        }
    }
  '';
in
{
  # 1. Install the caddy binary cleanly via Nix
  environment.systemPackages = [ pkgs.caddy ];
  environment.defaultPackages = with pkgs; [];

  # 2. Tell nix-darwin to run Caddy as a native system daemon on port 443
  launchd.daemons.caddy = {
    script = "${pkgs.caddy}/bin/caddy run --config ${caddyfile} --adapter caddyfile";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/var/log/caddy.log";
      StandardErrorPath = "/var/log/caddy.err";
    };
  };

  # 3. Manage your applications via Homebrew casks cleanly
  homebrew = {
    enable = true; # Ensures homebrew evaluation is activated
    casks = [
      "jellyfin"
      "transmission"
    ];
    brews = []; # Cleaned up duplicate homebrew caddy binary
  };
}
