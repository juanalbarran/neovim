{
  vim.keymaps = {
    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      silent = true;
      desc = "LSP: [R]e[N]ame";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      silent = true;
      desc = "LSP: [G]o to [D]efinition";
    }
    {
      mode = "n";
      key = "<leader>gtd";
      action = "<cmd>lua vim.lsp.buf.type_definition()<CR>";
      silent = true;
      desc = "LSP: [G]o to [T]ype [D]efinition";
    }
    {
      mode = "n";
      key = "<leader>gD";
      action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
      silent = true;
      desc = "LSP: [G]o to [D]eclaration";
    }
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
      silent = true;
      desc = "LSP: [G]o to [I]mplementation";
    }
    {
      mode = "n"
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      silent = true;
      desc = "LSP: [C]ode [A]ction";
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      silent = true;
      desc = "LSP: [G]o to [R]eferences";
    }
  }
}
