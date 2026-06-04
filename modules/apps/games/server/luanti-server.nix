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

  launchd.daemons.luanti-server = {
    serviceConfig = {
      Label = "org.nixos.luanti-server";
      UserName = "luanti";
      GroupName = "luanti";
      WorkingDirectory = "/var/lib/luanti";
      ProgramArguments = [
        "${pkgs.luanti}/bin/luanti"
        "--server"
        "--world"
        "/var/lib/luanti/worlds/Rowena"
      ];
      RunAtLoad = true;
      KeepAlive = true;
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
