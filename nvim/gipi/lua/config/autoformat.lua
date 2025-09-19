-- Autoformat setting
local set_autoformat = function(pattern, bool_val)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = function()
      vim.b.autoformat = bool_val
    end,
  })
end

set_autoformat({ "cpp" }, false)
set_autoformat({ "yaml" }, false)
set_autoformat({ "lua" }, true)

-- Autoformat function
local function format()
  if vim.b.autoformat then
    -- Your formatting logic here, e.g., calling a formatter
    vim.lsp.buf.formatting_sync() -- or another formatting command
  end
end

-- Create an autocommand to call format on specific events
vim.api.nvim_create_autocmd({ "BufWritePre", "InsertLeave" }, {
  callback = format,
})
