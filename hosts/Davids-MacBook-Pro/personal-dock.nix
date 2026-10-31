{ config, self, ... }:
let
  smallSpacer = { spacer = { small = true;  }; };
  bigSpacer   = { spacer = { small = false; }; };
  chromeWebApp = "/Users/david/Applications/Chrome\ Apps.localized/";
  nixApp = "/Applications/Nix\ Apps/";
in
{
    system.defaults.dock = {
        autohide = false;
        tilesize = 48;
        mru-spaces = false;

        persistent-apps = [
            "/System/Applications/Apps.app"
            smallSpacer
            (nixApp + "Google\ Chrome.app")
            "/Applications/Gemini.app"
            # "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
            (chromeWebApp + "YouTube.app")
            "/System/Applications/Mail.app"
            smallSpacer
            (chromeWebApp + "Messages.app")
#            "/System/Applications/Messages.app"
#            "/System/Applications/Phone.app"
            (chromeWebApp + "Google\ Meet")
            smallSpacer
#            "/System/Applications/Notes.app"
            (chromeWebApp + "Google\ Keep.app")
            "/System/Applications/Reminders.app"
            "/System/Applications/Calendar.app"
            smallSpacer
            "/System/Applications/Shortcuts.app"
            (nixApp + "IntelliJ\ IDEA.app")
            (nixApp + "PhpStorm.app")
            (nixApp + "WebStorm.app")
            (chromeWebApp + "Google\ AI\ Studio.app")
            "/Applications/Antigravity\ IDE.app"
            "/Applications/Xcode.app"
            smallSpacer
            "/System/Applications/Utilities/Screen\ Sharing.app"
            "/Applications/LinkMyMac.app"
            "/Applications/iTerm.app"
            "/System/Applications/System\ Settings.app"
        ];
    };
}