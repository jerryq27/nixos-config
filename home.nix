{ config, pkgs, ... }:

{
    home.stateVersion = "25.11"; 

    # The packages this user wants
    home.packages = with pkgs; [
        neovim
        tmux
        # htop
        # fastfetch
    ];

    # Basic configuration for programs
    programs.git = {
        enable = true;
        settings.users = {
            name = "Gerardo (Jerry) Quintero";
            email = "jerry@nixos.vbox";
        };
    };
    
    xdg.userDirs = {
        enable = true;
        createDirectories = true; # This tells HM to actually mkdir the paths
        extraConfig = {
            XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
        };
    };
    
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
