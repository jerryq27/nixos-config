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

  dconf.settings = let gnomeExtensions = "org/gnome/shell/extensions"; in {
    # Enable GNOME extensions
    "org/gnome/shell" = {
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
    # Extensions customizations
    "${gnomeExtensions}/dash-to-dock" = {
      custom-theme-shrink = true;
    };
    "${gnomeExtensions}/emoji-copy" = {
      always-show = false;
    };
    "${gnomeExtensions}/arcmenu" = let nixosIcon = 22; in {
      distro-icon = nixosIcon;
      menu-layout = "GnomeOverview";
    };
  };
}