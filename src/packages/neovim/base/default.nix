# src/packages/neovim/base/_manifest.nix
{ root }:
root.lib.assembleNeovim { name = "base"; }
