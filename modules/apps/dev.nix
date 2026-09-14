{ pkgs, ... }:
{
    environment.defaultPackages = with pkgs; [
        mas
        tree
        jetbrains.phpstorm
        jetbrains.webstorm
        jetbrains.idea
        openjdk25
    ];

    homebrew = {
        masApps = {
          "Apple Developer"   = 640199958;
          "Swift Playgrounds" = 1496833156;
          "Transporter"       = 1450874784;
          "TestFlight"        = 899247664;
          "Headrest"          = 6444033141;
        };

        casks = [
          "android-studio"
        ];
    };

    # 2. Configure Environment Variables Globally
      environment.variables = {
        ANDROID_HOME = "$HOME/Library/Android/sdk";
      };

      # 3. Add Android SDK Tools to your shell PATH (Zsh / Bash)
      programs.zsh.interactiveShellInit = ''
        # Add Android Platform Tools (adb, fastboot)
        export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

        # Add Android Build Tools (apksigner, aapt)
        export PATH="$PATH:$HOME/Library/Android/sdk/build-tools"

        # Add Emulator engine tools
        export PATH="$PATH:$HOME/Library/Android/sdk/emulator"

        # Add Command Line Tools (sdkmanager, avdmanager)
        # Note: Android Studio places these under a specific structure
        export PATH="$PATH:$HOME/Library/Android/sdk/cmdline-tools/latest/bin"
      '';

    # Ensure the Nix-managed OpenJDK is linked properly for Android Studio
    # This helps Android Studio find the correct Java path
    system.activationScripts.postActivation.text = ''
      sudo ln -sfn ${pkgs.openjdk25}/Contents/Home /Library/Java/JavaVirtualMachines/openjdk-25.jdk
    '';
}
