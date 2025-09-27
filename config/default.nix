# config/default.nix
{
  imports = [
    ./plugins/oil.nix
    ./plugins/lualine.nix
    ./plugins/fzf-lua.nix
    ./plugins/treesitter.nix
    ./plugins/autopairs.nix
    ./plugins/noice.nix
    ./plugins/conform.nix
    ./plugins/which-key.nix
    ./plugins/tabout.nix
    ./plugins/blink-cmp.nix

    ./options.nix
    ./keymaps.nix
    ./colorschemes.nix
  ];
}
