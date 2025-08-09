{
    description = "My neovim flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
        neovim = {
            url = "github:nix-community/neovim-nightly-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, neovim, flake-utils }: 
        flake-utils.lib.eachDefaultSystem (system:
        let
            overlayFlakeInputs = prev: final: {
                nvim = neovim.packages.${system}.neovim;
            };
            overlayNeovimKukenan = prev: final: {
                neovimKukenan = import ./packages/neovim-kukenan.nix {
                    pkgs = final;
                };
            };
            pkgs = import nixpkgs {
                system = system;
                overlays = [ overlayFlakeInputs overlayNeovimKukenan ];
            };
        in
        {
            packages.kukenan = pkgs.neovimKukenan;
            apps.kukenan = {
                type = "app";
                program = "${pkgs.neovimKukenan}/bin/nvim";
            };
        }
    );
}
