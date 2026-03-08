{ config, lib, ... }:
{
    system.defaults.dock = {
        autohide = lib.mkDefault true;
        tilesize = lib.mkDefault 64;
        mru-spaces = lib.mkDefault true;
        persistent-apps = lib.mkDefault [
            "/System/Applications/Apps.app"
            "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
            "/System/Applications/Messages.app"
            "/System/Applications/Mail.app"
            "/System/Applications/Maps.app"
            "/System/Applications/Photos.app"
            "/System/Applications/FaceTime.app"
            "/System/Applications/Calendar.app"
            "/System/Applications/Contacts.app"
            "/System/Applications/Reminders.app"
            "/System/Applications/Freeform.app"
            "/System/Applications/TV.app"
            "/System/Applications/Music.app"
            "/System/Applications/News.app"
            "/Applications/Keynote.app"
            "/Applications/Numbers.app"
            "/Applications/Pages.app"
            "/System/Applications/Notes.app"
            "/System/Applications/App\ Store.app"
            "/System/Applications/iPhone\ Mirroring.app"
            "/System/Applications/System\ Settings.app"
        ];
    };
}