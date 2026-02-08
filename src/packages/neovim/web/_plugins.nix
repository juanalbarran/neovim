# src/packages/neovim/web/_plugins.nix
{pkgs}:
with pkgs.vimPlugins; [
  # LSP Plugin
  nvim-vtsls

  # Linting and Formattig
  nvim-lint
]
