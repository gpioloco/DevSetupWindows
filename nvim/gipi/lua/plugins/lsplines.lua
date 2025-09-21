return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      -- disable virtual_text, enable virtual_lines
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
      })
    end,
  }
