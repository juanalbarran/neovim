# src/packages/neovim/rust/_treesitterPlugins.nix
{}: treesitterPlugins:
with treesitterPlugins; [
  rust
  toml
]
