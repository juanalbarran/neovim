# config/plugins/tabout.nix
{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    tabout-nvim
  ];
  extraConfigLua = ''
    require("tabout").setup({
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
    });
  '';
}
