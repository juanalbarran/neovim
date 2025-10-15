{
vim.keymaps = [
  # Files
    {
      mode = "n";
      key = "-";
      silent = true;
      action = "<cmd>Oil<CR>";
      desc = "File Explorer";
    }
    {
      mode = "n";
      key = "<leader>ff";
      silent = true;
      action = "<cmd>FzfLua files<CR>";
      desc = "[F]ind [F]iles";
    }
    {
      mode = "n";
      key = "<leader>fg";
      silent = true;
      action = "<cmd>FzfLua grep<CR>";
      desc = "[F]ind [G]rep";
    }
    {
      mode = "n";
      key = "<leader>cs";
      silent = true;
      action = "<cmd>FzfLua colorscheme<CR>";
      desc = "Find [C]olor[S]cheme";
    }
    {
      mode = "n";
      key = "<leader>b";
      silent = true;
      action = "<cmd>FzfLua buffers<CR>";
      desc = "[F]ind [B]uffers";
    }
    {
      mode = "n";
      key = "<leader>fk";
      silent = true;
      action = "<cmd>FzfLua keymaps<CR>";
      desc = "[F]ind [K]eymaps";
    }
    {
      mode = "n";
      key = "<leader>fw";
      silent = true;
      action = "<cmd>FzfLua grep_cword<CR>";
      desc = "[F]ind current [W]ord";
    }
  ];
}
