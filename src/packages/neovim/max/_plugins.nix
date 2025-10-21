# src/packages/neovim/max/_plugins.nix
{
  pkgs,
  root,
}:
with pkgs.vimPlugins;
with root.packages.vimPlugins;
[
  # Look & Feel
  lualine-nvim
  noice-nvim
  nvim-notify
  which-key-nvim

  # Colorsheme
  zenbones-nvim
  lush-nvim
  alabaster

  # Files
  oil-nvim
  fzf-lua

  # Editing
  nvim-autopairs
  tabout-nvim
  nvim-surround

  # Icons
  nvim-web-devicons
  mini-icons

  # Utils
  nvim-colorizer-lua
  render-markdown-nvim
  diffview-nvim

  # Completion
  blink-cmp

  # Language Server Protocol
  nvim-lspconfig
  nvim-vtsls

  # Linting & formatting
  nvim-lint
  conform-nvim

  # Commenting
  vim-commentary

  # Treesitter
  nvim-treesitter
]
