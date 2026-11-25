{ ... }:
{
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
      enableCompletion = true;
      enableFastSyntaxHighlighting = true;
      enableSyntaxHighlighting = false;
      histSize = 100000;
    };
  };
}