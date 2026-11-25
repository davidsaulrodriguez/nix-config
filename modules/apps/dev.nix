{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
    jetbrains.phpstorm
    jetbrains.webstorm
    jetbrains.idea
    openjdk25
    fnm
  ];

  # Automatically hook direnv + nix-direnv into shell
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  homebrew = {
    masApps = {
      "Apple Developer"   = 640199958;
      "Swift Playgrounds" = 1496833156;
      "Transporter"       = 1450874784;
      "TestFlight"        = 899247664;
      "Headrest"          = 6444033141;
      "LinkMyMac"         = 6755784154;
    };

    casks = [
      "android-studio"
      "herd"
    ];
  };

  # Configure Android SDK environment variable globally
  environment.variables = {
    ANDROID_HOME = "$HOME/Library/Android/sdk";
  };

  # Add Android SDK tools and fnm to interactive Zsh sessions
  programs.zsh.interactiveShellInit = ''
    # Add Android Platform Tools (adb, fastboot), Emulator, and Command Line Tools
    export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
    export PATH="$PATH:$HOME/Library/Android/sdk/emulator"
    export PATH="$PATH:$HOME/Library/Android/sdk/cmdline-tools/latest/bin"

    # Add latest installed Android Build Tools version directory (apksigner, aapt, zipalign)
    local latest_android_bt=("$HOME/Library/Android/sdk/build-tools"/*(NOn[1]))
    (( $#latest_android_bt )) && export PATH="$PATH:$latest_android_bt"

    # Fast Node Manager (fnm) — auto-switches on .nvmrc / .node-version
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';

  # Link the Nix-managed OpenJDK .jdk bundle so macOS java_home and Android Studio discover it
  system.activationScripts.postActivation.text = ''
    mkdir -p /Library/Java/JavaVirtualMachines
    ln -sfn ${pkgs.openjdk25}/Library/Java/JavaVirtualMachines/zulu-25.jdk /Library/Java/JavaVirtualMachines/openjdk-25.jdk
  '';
}
