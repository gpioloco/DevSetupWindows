-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "telescope"
vim.opt.clipboard = "unnamedplus"
vim.g.autoformat = false

-- Use 2 spaces for indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "lisp", "scheme", "clojure", "fennel" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true -- use spaces instead of tabs
  end,
})
