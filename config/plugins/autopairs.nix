{ pkgs, ... }:
{
  vim.extraPlugins = with pkgs.vimPlugins; {
    nvim-autopairs = {
      package = nvimautopairs;
      setup = ''require("nvim-autopairs").setup({})'';
    };
  };
}

