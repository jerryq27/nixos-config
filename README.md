## Home Manager

Home manager manages its own modules separate from NixOS. So properties and arguments are unique to home manager in ./home.

## Customizations

### Assets

Assets are also located in the Nix store. Find icons with `ls /nix/store | grep icon`

### GNOME

GNOME and GNOME Extensions uses `dconf` for settings. To see options being set, run `dconf watch /org/gnome/shell/`

## Resources

[Nixpkgs](https://search.nixos.org/packages)
[Home Manager Modules](https://nix-community.github.io/home-manager/options.xhtml)
[NixOS Wiki - For Package Options](https://wiki.nixos.org/w/index.php)
[Home Manager Options Search](https://home-manager-options.extranix.com/)
