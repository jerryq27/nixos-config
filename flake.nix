{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = { self, nixpkgs } @ inputs: {
    nixosConfigurations = {
      vbox = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
	  ./configuration.nix
	  ./hosts/vbox/hardware-configuration.nix
        ];
      };
      # jLaptop = nixpkgs.lib.nixosSystem {};
      # jDesktop = nixpkgs.lib.nixosSystem {};
      # jServer = nixpkgs.lib.nixosSystem {};
      # jRspi = nixpkgs.lib.nixosSystem {};
    };
  };
}
