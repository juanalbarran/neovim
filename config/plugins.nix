# config/plugins.nix
{ pkgs }:

with pkgs.vimPlugins; {
  start = [
    # plugin manager
    lazy-nvim

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

    # format
    conform-nvim

    # syntax
    nvim-treesitter.withAllGrammars
      
    # colorschemes
    zenbones-nvim
    gruvbox-nvim
    kanagawa-nvim
    lush-nvim

    # icons
    nvim-web-devicons

    # ui
    noice-nvim
    lualine-nvim
  ];
}
