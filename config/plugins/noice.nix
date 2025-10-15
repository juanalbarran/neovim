{ pkgs, ... }:
{
  vim = {
    startPlugins = with pkgs.vimPlugins; [
      noice-nvim
      nui-nvim
      nvim-notify
      nvim-treesitter
    ];
    pluginRC.nvim-notify = ''
      require("notify").setup({})
    '';
    pluginRC.noice-nvim = ''
      require("noice").setup({})
    '';
  };
}
