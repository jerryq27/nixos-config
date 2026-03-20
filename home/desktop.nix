{ config, ... }:

{
  imports = [ ./base.nix ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # This tells HM to actually mkdir the paths
    extraConfig = {
      XDG_PROJECTS_DIR = "/home/${config.home.username}/Projects";
    };
  };
  
  programs.vscode.enable = true;
  programs.onlyoffice.enable = true;
  # programs.gimp.enable = true;
  # programs.godot.enable = true;
  programs.obs-studio.enable = true;
  programs.obsidian.enable = true;
  programs.zed-editor.enable = true;
}