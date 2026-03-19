-- src/packages/neovim/csharp/__config/lua/lsp-csharp.lua
local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function(args)
    local root_dir = vim.fs.root(args.buf, { ".sln", ".csproj", ".git" })
        or vim.fn.getcwd()

    vim.lsp.start({
      name = "omnisharp",
      cmd = { "OmniSharp" },
      root_dir = root_dir,

      -- INJECT BLINK CAPABILITIES HERE
      capabilities = capabilities,

      settings = {
        FormattingOptions = {
          EnableEditorConfigSupport = true,
          OrganizeImports = true,
        },
        RoslynExtensionsOptions = {
          EnableAnalyzersSupport = true,
          EnableImportCompletion = true,
        },
        Sdk = {
          IncludePrereleases = true,
        },
      },
    })
  end,
})
