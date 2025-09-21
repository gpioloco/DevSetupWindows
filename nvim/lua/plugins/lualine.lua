return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- Setup lualine with normal theme
    lualine.setup({
      options = {
        theme = "horizon", -- base theme
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "quickfix", "nvim-tree" },
    })

    local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }

    -- Transparent sections: b, c, x
    local transparent_sections = {
      b = { fg = "#c0caf5", bg = "NONE" },
      c = { fg = "#f0f0f0", bg = "NONE" },
      x = { fg = "#c0caf5", bg = "NONE" },
    }

    -- Apply highlights for transparent sections
    for _, mode in ipairs(modes) do
      for section, colors in pairs(transparent_sections) do
        vim.api.nvim_set_hl(0, "lualine_" .. section .. "_" .. mode, { fg = colors.fg, bg = colors.bg })
        vim.api.nvim_set_hl(0, "lualine_" .. section .. "_" .. mode .. "_separator", { fg = "#ffffff", bg = "NONE" })
      end
    end

    -- Make StatusLine transparent
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
  end,
}
