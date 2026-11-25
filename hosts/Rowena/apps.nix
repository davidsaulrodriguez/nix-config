{ pkgs, ... }:
let
  # Build a declarative Caddyfile text asset with correct subdomains
  caddyfile = pkgs.writeText "Caddyfile" ''
    jellyfin.enyutech.com {
        reverse_proxy 127.0.0.1:8096
        tls internal
    }

    transmission.enyutech.com {
        reverse_proxy 127.0.0.1:9091
        tls internal
    }
  '';
in
{
  # 1. Install the caddy binary cleanly via Nix
  environment.systemPackages = [ pkgs.caddy ];

  # 2. Run Caddy as a native system daemon on port 443
  launchd.daemons.caddy = {
    script = "${pkgs.caddy}/bin/caddy run --config ${caddyfile} --adapter caddyfile";
    environment.HOME = "/var/root"; # Required by Caddy/Go to store `tls internal` PKI certs
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/var/log/caddy.log";
      StandardErrorPath = "/var/log/caddy.err";
    };
  };

  # 3. Manage server apps via Homebrew and Mac App Store
  homebrew = {
    casks = [
      "jellyfin"
      "transmission"
    ];
    masApps = {
      "Tailscale" = 1475387142;
    };
  };
}
