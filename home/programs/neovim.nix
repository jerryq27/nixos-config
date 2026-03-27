{ osConfig, defaults, hostConfig, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
      set number
    '';
  };
}