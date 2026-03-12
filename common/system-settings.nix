{pkgs, self, lib, }: {

    system = {
        stateVersion = 6; # backwards compatibility
        configurationRevision = self.rev or self.dirtyRev or null; # Git revision for `common-version`
    };

    nix = {
        enable = false; # Disable Determinate Nix since I am using their installer

        settings = {
            experimental-features = "nix-command flakes"; # Flakes and new CLI
        };
    };

    power = {
        sleep = {
            computer = lib.mkDefault null; # Amount of idle time (in minutes) until the computer sleeps. (Can be "never")
            display = lib.mkDefault null; # Amount of idle time (in minutes) until displays sleep. (Can be "never")
            harddisk = lib.mkDefault null; # Amount of idle time (in minutes) until hard disks sleep. (Can be "never")
            allowSleepByPowerButton = lib.mkDefault null; # Boolean, but can be null
        };

        restartAfterFreeze = lib.mkDefault null; # Boolean, default is null
        restartAfterPowerFailure = lib.mkDefault null; # Boolean, default is null
    };

    programs = {
        zsh = {
            enable = lib.mkDefault true;
            enableAutosuggestion = lib.mkDefault false;
            enableFastSyntaxHighlighting = lib.mkDefault false;
            enableSyntaxHighlighting = lib.mkDefault false;
            histSize = lib.mkDefault 2000;

        };
    };

    security = {
        pam.services = {
            sudo_local = {
                enable = lib.mkDefault true; # Enable managing /etc/pam.d/sudo_local with nix-darwin
                touchIdAuth = lib.mkDefault true; # Enable Touch ID for sudo because typing passwords is inconvenient
                watchIdAuth = lib.mkDefault true; # Enable sudo auth with Apple Watch (convenient for keyboards without TouchID [MacBook Neo])
            };
        };
    };
}