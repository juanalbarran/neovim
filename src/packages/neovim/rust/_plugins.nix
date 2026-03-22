# src/packages/neovim/rust/_plugins.nix
{
  pkgs,
  root,
}:
with pkgs.vimPlugins;
with root.packages.vimPlugins; [
  rustaceanvim
  crates-nvim
]
