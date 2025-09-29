# flake.nix
{
  description = "A Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        packages.default = import ./config/ inherit { pkgs };

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/nvim";
        };
      }
    );
}
