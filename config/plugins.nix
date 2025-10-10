# config/plugins.nix
{ pkgs }:

with pkgs.vimPlugins; {
  start = [
    # core
    plenary-nvim

    # editing
    nvim-autopairs
    tabout-nvim
    nvim-surround

    # files
    oil-nvim
    fzf-lua

    # lsp
    nvim-lspconfig
    mason-nvim
    mason-lspconfig-nvim

    # autocomplete
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp_luasnip
    luasnip
    blink-cmp

    # format
    conform-nvim

    # syntax
    nvim-treesitter.withAllGrammars
      
    # colorschemes
    zenbones-nvim
    gruvbox-nvim
    kanagawa-nvim
    rose-pine
    lush-nvim

    # icons
    nvim-web-devicons
    mini-icons

    # ui
    nvim-notify
    lualine-nvim
    lualine-lsp-progress
    noice-nvim

    # utils
    which-key-nvim
    nvim-colorizer-lua
  ];
}
