local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Disable formatting for clangd
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    -- Optionally, remove any existing format on save autocmds
    vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
  end,
})

-- disable auto format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Prevent any LSP formatting
    vim.lsp.buf.formatting_sync(nil, 1000)
  end,
  group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
})
