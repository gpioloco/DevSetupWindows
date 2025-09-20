return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  opts = {
    defaults = {
      cwd = vim.loop.cwd(),
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
        },
      },
      preview = {
        treesitter = false,
      },
    },
    pickers = {
      grep_string = {
        only_sort_text = true,
        shorten_path = true,
      },
      git_files = {
        show_untracked = true,
      },
    },
    extensions = {
      -- configure extensions here if needed
    },
  },
}
