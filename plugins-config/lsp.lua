local lsp_config = require('lspconfig')
local lsp_completion = require('completion')

local on_attach = function(client, bufnr)
  lsp_completion.on_attach(client)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


  local default_opts = { noremap = true, silent = true }
  local expr_opts = { noremap = true, expr = true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', default_opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', default_opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.reference()<cr>', default_opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', default_opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', default_opts)
  buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', default_opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', default_opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', default_opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', default_opts)
  buf_set_keymap('i', '<tab>', 'pumvisible() ? "\\<c-n>" : "\\<tab>"', expr_opts)
  buf_set_keymap('i', '<s-tab>', 'pumvisible() ? "\\<c-p>" : "\\<s-tab>"', expr_opts)
end


local lsp_default_config = {
  on_attach = on_attach,
}

local servers = {
  gopls = {
    cmd = {'gopls', '-remote=auto'},
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      },
    }, 
  tsserver = {}, 
}

for server, config in pairs(servers) do
  lsp_config[server].setup(vim.tbl_deep_extend('force', lsp_default_config, config))
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    signs = false,
    update_in_insert = true,
  }
)

vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
