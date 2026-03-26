{ config, pkgs, inputs, defaults, hostConfig, ... }:

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

  # For TTY sessions
  console.keyMap = "us";

  # Configure keymap in X11 (GNOME also uses these values on Wayland)
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Install system packages.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  # Dumb install, just installs a package.
  # environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    # neovim
    # ghostty
    # git
  # ];

  # Module install, allows for custom configurations for each program.
  # programs.firefox.enable = true;
  # programs.onlyoffice.enable = true;
  # programs.ghostty.enable = true;
  # programs.neovim.enable = true;
  programs.vim.enable = true;
  programs.git.enable = true;

  # Enable services.
  # services.openssh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.  
  users.users.${defaults.user} = {
    isNormalUser = true; # Specifies that this is a real user and not a user like "www-data" that doesn't need a home, users group, etc.
    description = defaults.user; # Comment field in the /etc/passwd entry
    extraGroups = [ "networkmanager" "wheel" ];
  };
  

  # Attach home manager and link user with a home definition.
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit defaults hostConfig;
    };
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}