-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local diagnostics_enabled = true

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>gs", require("telescope.builtin").grep_string, { desc = "Grep string under cursor" })
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").git_files, { desc = "Search git files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").find_files, { desc = "Find Files telescope" })
vim.keymap.set("n", "<leader>cb", function()
  vim.cmd("w")
  vim.cmd("split | terminal cargo build")
end, { desc = "Cargo Build" })

vim.keymap.set("n", "<leader>cd", function()
  vim.cmd("w")
  vim.cmd("split | terminal cargo run")
end, { desc = "Cargo Run" })


vim.keymap.set('n', '<leader>dd', function()
  if diagnostics_enabled then
    vim.diagnostic.disable()
    print("Diagnostics disabled")
  else
    vim.diagnostic.enable()
    print("Diagnostics enabled")
  end
  diagnostics_enabled = not diagnostics_enabled
end, { desc = "Toggle diagnostics" })
