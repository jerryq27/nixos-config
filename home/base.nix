# Home Manager module so arguments are different.
{ osConfig, defaults, hostConfig, ... }:

{
  home.stateVersion = osConfig.system.stateVersion;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./programs/bash.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/tmux.nix
    ./programs/fastfetch.nix
  ];

  # More for a server setup
  # environment.variables.EDITOR = "nvim";
  home.sessionVariables = let editor = "nvim"; in {
    EDITOR = editor;
    GIT_EDITOR = editor;
  };
}
