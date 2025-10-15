{
  vim.keymaps = {
    # Pane movement
    {
      mode = "n";
      key = "<c-l>"
      silent = true;
      action = "<c-w>l";
    }
    {
      mode = "n";
      key = "<c-h>"
      silent = true;
      action = "<c-w>h";
    }
    {
      mode = "n";
      key = "<c-j>"
      silent = true;
      action = "<c-j>l";
    }
    {
      mode = "n";
      key = "<c-k>"
      silent = true;
      action = "<c-k>l";
    }
    # Pane split
    {
      mode = "n";
      key = "<leader>sv";
      silent = true;
      action = "<cmd>vsplit<cr>";
    }
  };
}
