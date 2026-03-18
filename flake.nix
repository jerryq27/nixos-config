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
      defaultSystem = "x86_64-linux";
      defaultUser = "jerry";
    in {
      vbox = nixpkgs.lib.nixosSystem {
        system = defaultSystem;
        # Passes values to all modules
        specialArgs = {
          inherit inputs defaultUser; # Evaluates to specialArgs = { inputs = inputs; defaultUser = defaultUser }
        };
        modules = [
          ./hosts/vbox/configuration.nix
          ./hosts/vbox/hardware-configuration.nix
        ];
      };

      # laptop = nixpkgs.lib.nixosSystem {
      #   system = defaultSystem;
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/default.nix
      #   ];
      # };

      # desktop = nixpkgs.lib.nixosSystem {
      #   system = defaultSystem;
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./hosts/default.nix
      #   ];
      # };
      
      # server = nixpkgs.lib.nixosSystem {
      #   system = defaultSystem;
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
