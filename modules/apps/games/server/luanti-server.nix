{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.luanti
  ];

  users.users.luanti = {
    isSystemUser = true;
    group = "luanti";
    home = "/var/lib/luanti";
    createHome = true;
  };

  users.groups.luanti = {};

  networking.firewall.allowedUDPPorts = [ 30000 ];

  systemd.services.luanti-server = {
    description = "Luanti Dedicated Server";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "luanti";
      Group = "luanti";
      WorkingDirectory = "/var/lib/luanti";
      ExecStart = "${pkgs.luanti}/bin/luanti --server --world /var/lib/luanti/worlds/Rowena";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };

  environment.etc."luanti/minetest.conf".text = ''
    port = 30000
    server_announce = true
    server_name = Rowena Luanti Server
    server_description = Luanti server on Rowena
    # server_address = luanti.enyutech.com
    # server_url = https://luanti.enyutech.com
    motd = Welcome to Rowena
    max_users = 10
    enable_rollback_recording = true
    disallow_empty_password = true
    # static_spawnpoint = 0, 16, 0
  '';
}
