{ config, ... }:
let
  smallSpacer = { spacer = { small = true;  }; };
  bigSpacer   = { spacer = { small = false; }; };
in
{
    system.defaults.dock = {
        autohide = false;
        tilesize = 48;
        mru-spaces = false;

        persistent-apps = [
            "/System/Applications/Apps.app"
            smallSpacer
            "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
            "/System/Applications/Mail.app"
            smallSpacer
            "/System/Applications/Messages.app"
            "/System/Applications/Phone.app"
            "/System/Applications/Facetime.app"
            smallSpacer
            "/System/Applications/Notes.app"
            "/System/Applications/Reminders.app"
            "/System/Applications/Calendar.app"
            smallSpacer
            "/System/Applications/Shortcuts.app"
            "/Applications/Nix\ Apps/PhpStorm.app"
            "/Applications/Nix\ Apps/WebStorm.app"
            "/Applications/Xcode.app"
            smallSpacer
            "/System/Applications/Utilities/Screen\ Sharing.app"
            "/System/Applications/iPhone\ Mirroring.app"
            "/Applications/iTerm.app"
            "/System/Applications/System\ Settings.app"
        ];
    };
}