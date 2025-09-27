# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };
  outputs = { self, nixpkgs, nvf, ... }: {
    
    packages."x86_64-linux".kukenan =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./config ];
      }).neovim;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
	nvf.nixosModules.default
      ];
    };
  };
}
