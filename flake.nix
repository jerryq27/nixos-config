{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs = {
        url = "github:nixos/nixpkgs?ref=nixos-25.11";
    };
    home-manager = {
        url = "github:nix-community/home-manager/release-25.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager } @ inputs: {
    nixosConfigurations = {
      vbox = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
            ./configuration.nix
            ./hosts/vbox/hardware-configuration.nix
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.users.jerry = import ./home.nix;
            }
        ];
      };
      # jLaptop = nixpkgs.lib.nixosSystem {};
      # jDesktop = nixpkgs.lib.nixosSystem {};
      # jServer = nixpkgs.lib.nixosSystem {};
      # jRspi = nixpkgs.lib.nixosSystem {};
    };
  };
}
