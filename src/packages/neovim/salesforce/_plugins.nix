# src/packages/neovim/salesforce/_plugins.nix
{
  pkgs,
  root,
}:
with pkgs.vimPlugins;
with root.packages.vimPlugins; [
  sf-nvim
]
