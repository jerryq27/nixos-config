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
  
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      lal = "ls -al";
      vim = "nvim";
      nix-check = "nix flake check";
      nix-update = "sudo nixos-rebuild switch --flake .#vbox";
      nix-clean = "nix-collect-garbage -d";
    };
    bashrcExtra = ''
      mkcd() {
        mkdir $1
        cd $1
      }
    '';
  };

  # Basic configuration for programs
  programs.git = {
    enable = true;
    settings.users = {
      name = "Gerardo (Jerry) Quintero";
      email = "jerry@nixos.vbox";
    };
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
