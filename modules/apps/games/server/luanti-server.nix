{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.luanti
  ];

  launchd.agents.luanti-server = {
      enable = true;
      serviceConfig = {
        Label = "org.nixos.luanti-server";
        ProgramArguments = [
          "${pkgs.luanti}/bin/luanti"
          "--server"
          "--world"
          "${config.home.homeDirectory}/luanti/worlds/Rowena"
        ];
        RunAtLoad = true;
        KeepAlive = true;
        WorkingDirectory = "${config.home.homeDirectory}/luanti";
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
  '';
}
