{
  vim.keymaps = [
    # Easier escape key
    {
      mode = "n";
      key = "jk";
      silent = true;
      action = "<Esc>";
    }
    {
      mode = "n";
      key = "kj";
      silent = true;
      action = "<Esc>";
    }
    {
      mode = "n";
      key = "<Esc>",
      silent = true;
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = vim.diagnostic.setlclist;
      desc = "Open diagnostic [Q]uickfix.";
    }
    
    # Movement
    {
      mode = "n";
      key = "<c-d>"
      silent = true;
      action = "<c-d>zz";
    }
    {
      mode = "n";
      key = "<c-u>"
      silent = true;
      action = "<c-u>zz";
    }
        # Buffer moves
    {
      mode = "n";
      key = "<leader>n";
      silent = true;
      action = "<cmd>bnext<cr>";
      desc = "[N]ext Buffer";
    }
    {
      mode = "n";
      key = "<leader>p";
      silent = true;
      action = "<cmd>bprevious<cr>";
      desc = "[P]revious Buffer";
    }
    # Hardtime
    {
      key = "<leader>th";
      mode = "n";
      silent = true;
      action = "<cmd>Hardtime toggle<CR>";
      desc = "[T]oggle [H]ardTime";
    }
  ];
}
