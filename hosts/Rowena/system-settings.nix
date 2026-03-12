{ pkgs, self, lib, config, ... }: {

    #################################
    #        Power Settings         #
    #################################
    power = {
        sleep = {
            computer = "never";
            display = "never";
            harddisk = "never";
            allowSleepByPowerButton = false;
        };

        restartAfterFreeze = true;
        restartAfterPowerFailure = true;
    };


    #################################
    #        Program Settings       #
    #################################
    programs = {
        zsh = {
            enableAutosuggestions = true;
            enableFastSyntaxHighlighting = true;
            enableSyntaxHighlighting = true;
            histSize = 100000;

        };
    };
}