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

        restartAfterFreeze = false;
        restartAfterPowerFailure = false;
    };


    #################################
    #        Program Settings       #
    #################################
    programs = {
        zsh = {
            enableAutosuggestion = true;
            enableFastSyntaxHighlighting = true;
            enableSyntaxHighlighting = true;
            histSize = 100000;

        };
    };
}