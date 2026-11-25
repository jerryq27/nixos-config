{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    arcmenu
    blur-my-shell
    dash-to-dock
    emoji-copy
    gnome-40-ui-improvements
    gsconnect
    just-perfection
    rounded-window-corners-reborn
  ];

  dconf.settings =
  let
    gnomeShell = "org/gnome/shell";
    gnomeExtensions = "${gnomeShell}/extensions";
    gnomeDesktop = "${gnomeShell}/desktop";
  in
  {
    # Enable GNOME extensions
    "${gnomeShell}" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        arcmenu.extensionUuid
        blur-my-shell.extensionUuid
        dash-to-dock.extensionUuid
        emoji-copy.extensionUuid
        gnome-40-ui-improvements.extensionUuid
        gsconnect.extensionUuid
        just-perfection.extensionUuid
        rounded-window-corners-reborn.extensionUuid
      ];
    };
    "${gnomeDesktop}/interface" = {
      color-scheme = "prefer-dark";
    };
    "${gnomeDesktop}/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/map-l.svg";
      primary-color = "#241f31";
    };
    # Extensions customizations
    "${gnomeExtensions}/dash-to-dock" = {
      custom-theme-shrink = true;
    };
    "${gnomeExtensions}/emoji-copy" = {
      always-show = false;
    };
    "${gnomeExtensions}/arcmenu" = let nixosIconId = 22; in {
      distro-icon = nixosIconId;
      menu-layout = "GnomeOverview";
      # force-menu-location = "MonitorCentered";
      runner-position = "Centered";
      runner-hotkey-open-primary-monitor = "<Super>r";
      runner-search-display-style = "Grid";
    };
  };
}