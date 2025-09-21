return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      rust_analyzer = {},
      clangd = {
        keys = {
          { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_markers = {
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac",
          "Makefile",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja",
          ".git",
        },
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
    },
    setup = {
      clangd = function(_, opts)
        local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
        require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))

        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function() end, -- empty callback disables auto-format
          group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        })

        opts.on_attach = function(client, bufnr)
          -- disable auto formatting (on save)
          local group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
          vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

          -- Do NOT disable documentFormattingProvider, keep it true
          -- so manual formatting with = and visual mode works
          -- client.server_capabilities.documentFormattingProvider = false
          -- client.server_capabilities.documentRangeFormattingProvider = false
        end

        return false
      end,
    },
  },
}
