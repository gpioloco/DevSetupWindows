return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  config = function()
    require("telescope").setup({
      defaults = {
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
          -- example options:
          only_sort_text = true,
          shorten_path = true,
          -- add more grep_string-specific options here
        },
        git_files = {
          show_untracked = true, -- include untracked files
        },
      },
      extensions = {
        -- configure extensions here if needed
      },
    })
  end,
}
