# src/packages/neovim/base/default.nix
{ root }:
root.lib.assembleNeovim { name = "base"; }
