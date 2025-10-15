{
  vim.binds.whichKey = {
    enable = true;
    register = {
      "<leader>f" = "+files"  # fzf-Lua
      "<leader>g" = "+go"     # LSP
    };
  };
}
