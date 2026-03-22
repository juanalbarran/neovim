# src/packages/neovim/rust/default.nix
{root}:
root.lib.assembleNeovim {name = "rust";}
