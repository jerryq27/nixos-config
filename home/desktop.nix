{ pkgs, config, ... }:

{
  imports = [ ./base.nix ];

  # Install packages.
  programs.anki.enable = true;
  programs.vscode.enable = true;
  programs.onlyoffice.enable = true;
  programs.obs-studio.enable = true;
  programs.obsidian.enable = true;
  programs.zed-editor.enable = true;
  programs.spotify-player.enable = true;
  programs.lutris.enable = true;
  # programs.thunderbird = {
  #   enable = true;
  #   profiles =
  #     {
  #       name = config.home.username;
  #       isDefault = true;
  #     };
  # };
  programs.vesktop.enable = true;

  # Packages without a Home Manager module
  home.packages = with pkgs; [
    # beekeeper-studio
    filezilla
    gimp
    gnome-tweaks
    godot
    htop
    inkscape
    postman
    qbittorrent
    signal-desktop
    steam
    # sublime4
    vlc

    # GNOME extensions
    gnomeExtensions.gsconnect
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-panel
    gnomeExtensions.emoji-copy
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # This tells HM to actually mkdir the paths
    extraConfig = {
      XDG_PROJECTS_DIR = "/home/${config.home.username}/Projects";
    };
  };

  # Enable GNOME extensions
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        gsconnect.extensionUuid
        blur-my-shell.extensionUuid
        dash-to-panel.extensionUuid
        emoji-copy.extensionUuid
      ];
    };
  };
}