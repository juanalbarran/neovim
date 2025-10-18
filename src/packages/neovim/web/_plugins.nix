# src/packages/neovim/web/_plugins.nix
{pkgs}:
with pkgs.vimPlugins; [
  nvim-vtsls
]
