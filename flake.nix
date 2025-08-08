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
            overlayNeovimCanaima = prev: final: {
                neovimCanaima = import ./packages/neovim-canaima.nix {
                    pkgs = final;
                };
            };
            pkgs = import nixpkgs {
                system = system;
                overlays = [ overlayFlakeInputs overlayNeovimCanaima ];
            };
        in
        {
            packages.canaima = pkgs.neovimCanaima;
            apps.canaima = {
                type = "app";
                program = "${pkgs.neovimCanaima}/bin/nvim";
            };
        }
    );
}
