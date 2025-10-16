-- lua/lsp.lua

if vim.g.did_load_autocommands_plugin then
  return
end
vim.g.did_load_autocommands_plugin = true

local function preview_location_callback(_, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  local buf, _ = vim.lsp.util.preview_location(result[1])
  if buf then
    local cur_buf = vim.api.nvim_get_current_buf()
    vim.bo[buf].filetype = vim.bo[cur_buf].filetype
  end
end

local function peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

local function peek_type_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/typeDefinition', params, preview_location_callback)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kukenan-lsp-config', {}),
  callback = function(event)
    local bufnr = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Attach plugins
    require('nvim-navic').attach(client, bufnr)

    vim.cmd.setLocal('signcolumn=yes')
    vim.bo[bufnr].bufhidden = 'hide'

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lus.vim.lsp.omnifunc'

    local function desc(description)
      return { noremap = true, silent = true, buffer = bufnr, desc = 'LSP: ' ..description }
    end

    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, desc('[G]o to [D]efinition'))
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, desc('[G]o to [D]eclaration'))
    vim.keymap.set('n', '<leader>gtd', vim.lsp.buf.type_definition, desc('[G]o to [T]ype [D]efinition'))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, desc('[R]e[n]ame'))
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, desc('[G]o to [R]eferences'))
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, desc('[G]o to [I]mplementation'))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, desc('[C]ode [A]ction'))
    vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, desc('Signature help'))
    vim.keymap.set('n', '<leader>pd', peek_definition, desc('[P]eek [D]efinition'))
    vim.keymap.set('n', '<leader>ptd', peek_type_definition, desc('[P]eek [T]ype [D]efinition'))

    -- Toggle server capabilities
    if client and client.server_capabilities.inlayHintProvider then
      vim.keymap.set('n', '<leader>th', function()
        local current_setting = vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }
        vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
      end, desc('[T]oggle inlay [H]ints'))
    end

    if client and client.lsp.protocol.Methods.textDocument_documentHighlight then
      local highlight_augroup = vim.api.nvim_create_augroup('kukenan-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kukenan-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kukenan-lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})
-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

local capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  nil_ls = {},
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua'
})
