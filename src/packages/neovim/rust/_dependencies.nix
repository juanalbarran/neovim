# src/packages/neovim/rust/_dependencies.nix
{pkgs}:
with pkgs; [
  cargo
  rustc
  rust-analyzer
  rustfmt
]
