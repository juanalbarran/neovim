# src/packages/neovim/light/_plugins.nix
{ pkgs }:
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

  # Utils
  nvim-colorizer-lua
  
]
