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
    nixosConfigurations = let
      defaults = {
        system = "x86_64-linux";
        user = "jerry";
      };
    in {
      vbox = nixpkgs.lib.nixosSystem {
        system = defaults.system;
        # Passes values to all modules
        specialArgs = {
          inherit inputs defaults; # Evaluates to specialArgs = { inputs = inputs; defaultUser = defaultUser }
          hostConfig = {
            machineName = "vbox";
            hostName = "nixos-vbox";
          };
        };
        modules = [
          ./hosts/vbox/configuration.nix
          ./hosts/vbox/hardware-configuration.nix
        ];
      };

      # laptop = nixpkgs.lib.nixosSystem {
      #   system = defaults.system;
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/default.nix
      #   ];
      # };

      # desktop = nixpkgs.lib.nixosSystem {
      #   system = defaults.system;
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/default.nix
      #   ];
      # };
      
      # server = nixpkgs.lib.nixosSystem {
      #   system = defaults.system;
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/default.nix
      #   ];
      # };
      
      # raspi = nixpkgs.lib.nixosSystem {
      #   system = "aarch64-linux";
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/default.nix
      #   ];
      # };

    };
  };
}
