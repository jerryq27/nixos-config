{ config, pkgs, defaultUser, ... }:

{
  imports = [ ./base.nix ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # This tells HM to actually mkdir the paths
    extraConfig = {
      XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
    };
  };
  
  programs.vscode.enable = true;
}