{ pkgs, config, ... }:

{
  imports = [ ./base.nix ];

  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # This tells HM to actually mkdir the paths
    extraConfig = {
      XDG_PROJECTS_DIR = "/home/${config.home.username}/Projects";
    };
  };
  
  programs.vscode.enable = true;
  programs.onlyoffice.enable = true;
  programs.obs-studio.enable = true;
  programs.obsidian.enable = true;
  programs.zed-editor.enable = true;

  # Packages without a Home Manager module
  home.packages = with pkgs; [
    gimp
    godot
    htop
  ];
}