# Home Manager module so arguments are different.
{ osConfig, defaults, hostConfig, ... }:

{
  home.stateVersion = osConfig.system.stateVersion;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      lal = "ls -al";
      nix-check = "nix flake check";
      nix-update = "sudo nixos-rebuild switch --flake \".#${hostConfig.machineName}\"";
      nix-clean = "nix-collect-garbage -d";
    };
    bashrcExtra = ''
      mkcd() {
        mkdir $1
        cd $1
      }
    '';
  };

  programs.git = {
    enable = true;
    settings.users = {
      name = "Gerardo (Jerry) Quintero";
      email = "jerry@nixos.vbox";
    };
  };

  # More for a server setup
  # environment.variables.EDITOR = "nvim";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
      set number
    '';
  };

  programs.tmux.enable = true;

  # # The packages this user wants
  # home.packages = with pkgs; [
  #   neovim
  #   tmux
  #   # htop
  #   # fastfetch
  # ];
}
