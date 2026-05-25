{ pkgs, self, lib, ... }: {

    #################################
    #        Power Settings         #
    #################################
    power = {
        sleep = {
            # computer = "never";
            # display = "never";
            # harddisk = "never";
            allowSleepByPowerButton = true;
        };

        restartAfterFreeze = true;
    };


    #################################
    #        Program Settings       #
    #################################
    programs = {
        zsh = {
            enableAutosuggestions = true;
            enableCompletion = true;
            enableFastSyntaxHighlighting = true;
            enableSyntaxHighlighting = false;
            histSize = 100000;

        };
    };

    #################################
    #   System Settings Overrides   #
    #################################
    system = {
        primaryUser = "david";
        defaults = {
            screencapture = {
                location = "~/Pictures/screenshots";
            };
        };
    };

    networking = {
        hostName = "Davids-MacBook-Pro";
    };
}