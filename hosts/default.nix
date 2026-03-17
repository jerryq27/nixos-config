{ config, pkgs, inputs, ... }:

let
  defaultUser = "jerry";
in
{
  # Common configurations for all hosts.

  # Special key in a modules's attribute set that says: before evaluating this module, evaluate these other modules and merge their results back into this module.
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.  
  users.users = {
    ${defaultUser} = {
      isNormalUser = true;
      description = "jerry";
      extraGroups = [ "networkmanager" "wheel" ];
    }
  };

  # Attach home manager and link user with a home definition.
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      ${defaultUser} = import ../home/default.nix;
    };
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}