{ osConfig, defaults, hostConfig, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      lal = "ls -al";
      nix-check = "nix flake check";
    #   nix-update = "sudo nixos-rebuild switch --flake .\"#${hostConfig.machineName}\"";
      nix-clean = "nix-collect-garbage -d";
      nix-system-clean = "sudo nix-collect-garbage -d";
    };
    bashrcExtra = ''
      mkcd() {
        mkdir $1
        cd $1
      }

      nix-update() {
        sudo nixos-rebuild switch --flake ".#${hostConfig.machineName}"
      }
    '';
  };
}