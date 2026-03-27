{ osConfig, defaults, hostConfig, ... }:
{
  programs.git = {
    enable = true;
    settings.users = {
      name = "Gerardo (Jerry) Quintero";
      email = "jerry@nixos.vbox";
    };
  };
}