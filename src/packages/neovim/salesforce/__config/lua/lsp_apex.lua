-- src/packages/neovim/salesforce/__config/lua/lsp_apex.lua
-- 1. Force filetype detection so Neovim knows what an Apex file is
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.cls", "*.trigger" },
  command = "set filetype=apex",
})

-- 2. Create an autocmd that fires ONLY when an Apex file is opened
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "apex", "apexcode" },
  callback = function(args)
    -- Start the LSP server natively and attach it to the current buffer
    vim.lsp.start({
      name = 'apex_ls',
      -- This uses the Nix wrapper script we created earlier
      cmd = { 'apex-language-server' },
      -- Tell the LSP where the project root is (looks for the sfdx config or git)
      root_dir = vim.fs.root(args.buf, { 'sfdx-project.json', '.git' }),
      -- Apex specific settings to reduce noise
      settings = {
        apex_enable_semantic_errors = false,
        apex_enable_completion_statistics = false,
      }
    })
  end,
})
