# src/packages/neovim/base/_plugins.nix
{
  pkgs,
  root,
}:
with pkgs.vimPlugins; [
  # Look & Feel
  lualine-nvim
  noice-nvim
  nvim-notify
  which-key-nvim

  # Colorsheme
  zenbones-nvim
  lush-nvim

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

  # Completion
  blink-cmp

  # Language Server Protocol
  lspsaga-nvim
  nvim-lspconfig

  # Linting & formatting
  nvim-lint
  conform-nvim

  # Commenting
  vim-commentary

  # Treesitter
  nvim-treesitter
]
