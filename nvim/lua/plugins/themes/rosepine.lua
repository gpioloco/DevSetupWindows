return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts =  {
      transparency = true,
    },
  config = function(_, opts)
    require("rose-pine").config(opts)
    vim.cmd.colorscheme("rose-pine")
  end
}
