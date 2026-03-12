-- src/packages/neovim/salesforce/__config/lua/lsp_apex.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "apex", "apexcode" },
  callback = function(args)
    -- THIS automates what you just did manually!
    -- (We removed the 'pcall' so if it ever fails, it warns you loudly)
    vim.treesitter.start(args.buf, 'apex')

    -- Start the LSP server natively
    vim.lsp.start({
      name = 'apex_ls',
      cmd = { 'apex-language-server' },
      root_dir = vim.fs.root(args.buf, { 'sfdx-project.json', '.git' }),
      settings = {
        apex_enable_semantic_errors = false,
        apex_enable_completion_statistics = false,
      }
    })
  end,
})
