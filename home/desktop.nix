{ pkgs, config, ... }:

{
  imports = [ ./base.nix ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # This tells HM to actually mkdir the paths
    extraConfig = {
      XDG_PROJECTS_DIR = "/home/${config.home.username}/Projects";
    };
  };

  programs.anki.enable = true;
  programs.vscode.enable = true;
  programs.onlyoffice.enable = true;
  programs.obs-studio.enable = true;
  programs.obsidian.enable = true;
  programs.zed-editor.enable = true;
  programs.spotify-player.enable = true;

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
    steam
  ];
}