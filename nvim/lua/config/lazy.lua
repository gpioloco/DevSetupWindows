local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    { 'rose-pine/neovim', name = 'rose-pine', lazy = false },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.cmd('colorscheme rose-pine')

-- Set background color to transparent
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "SnacksExplorerNormal", { bg = "NONE" })

local groups = {
  -- Core groups
  "Normal", "NormalFloat", "FloatBorder", "Visual", "CursorLine",
  "CursorLineNr", "StatusLine", "StatusLineNC", "LineNr", "SignColumn",
  "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb", "VertSplit",
  "Search", "IncSearch", "WildMenu", "TabLine", "TabLineFill", "TabLineSel",
  "Title", "Directory", "Comment", "Constant", "Identifier", "Statement",
  "PreProc", "Type", "Special", "Underlined", "Error", "Todo",
  "Folded", "FoldColumn", "CursorColumn", "ColorColumn",
  "NonText", "Whitespace", "EndOfBuffer", "MatchParen", "ModeMsg",
  "MoreMsg", "Question", "WarningMsg", "ErrorMsg", "StatusLineTerm",
  "StatusLineTermNC",

  -- Treesitter (common)
  "TSAnnotation", "TSAttribute", "TSBoolean", "TSCharacter", "TSComment",
  "TSConditional", "TSConstant", "TSConstructor", "TSDebug", "TSDefine",
  "TSError", "TSException", "TSField", "TSFloat", "TSFunction", "TSIdentifier",
  "TSInclude", "TSKeyword", "TSLabel", "TSMethod", "TSNamespace", "TSNone",
  "TSNumber", "TSOperator", "TSParameter", "TSParameterReference", "TSProperty",
  "TSPunctDelimiter", "TSPunctBracket", "TSPunctSpecial", "TSRepeat",
  "TSString", "TSStringRegex", "TSStringEscape", "TSSymbol", "TSTag",
  "TSTagDelimiter", "TSText", "TSStrong", "TSEmphasis", "TSUnderline",
  "TSStrike", "TSTitle", "TSLiteral", "TSURI", "TSMath", "TSNote",
  "TSWarning", "TSDanger",

  -- LSP
  "LspReferenceText", "LspReferenceRead", "LspReferenceWrite",
  "LspCodeLens", "LspCodeLensSeparator", "LspSignatureActiveParameter",
  "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint",
  "DiagnosticUnderlineError", "DiagnosticUnderlineWarn", "DiagnosticUnderlineInfo",
  "DiagnosticUnderlineHint", "DiagnosticFloatingError", "DiagnosticFloatingWarn",
  "DiagnosticFloatingInfo", "DiagnosticFloatingHint", "DiagnosticSignError",
  "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint",

  -- nvim-cmp
  "CmpItemAbbr", "CmpItemAbbrDeprecated", "CmpItemAbbrMatch", "CmpItemAbbrMatchFuzzy",
  "CmpItemKindText", "CmpItemKindMethod", "CmpItemKindFunction", "CmpItemKindConstructor",
  "CmpItemKindField", "CmpItemKindVariable", "CmpItemKindClass", "CmpItemKindInterface",
  "CmpItemKindModule", "CmpItemKindProperty", "CmpItemKindUnit", "CmpItemKindValue",
  "CmpItemKindEnum", "CmpItemKindKeyword", "CmpItemKindSnippet", "CmpItemKindColor",
  "CmpItemKindFile", "CmpItemKindReference", "CmpItemKindFolder", "CmpItemKindEnumMember",
  "CmpItemKindConstant", "CmpItemKindStruct", "CmpItemKindEvent", "CmpItemKindOperator",
  "CmpItemKindTypeParameter",

  -- Telescope
  "TelescopeBorder", "TelescopePromptBorder", "TelescopeResultsBorder",
  "TelescopePreviewBorder", "TelescopeSelection", "TelescopeMatching",
  "TelescopePromptPrefix", "TelescopeNormal", "TelescopePromptNormal",
  "TelescopeResultsNormal", "TelescopePreviewNormal",

  -- Gitsigns
  "GitSignsAdd", "GitSignsChange", "GitSignsDelete", "GitSignsAddNr",
  "GitSignsChangeNr", "GitSignsDeleteNr", "GitSignsAddLn", "GitSignsChangeLn",
  "GitSignsDeleteLn",

  -- Mason
  "MasonHighlight", "MasonHighlightBlock", "MasonHighlightBlockBold",
  "MasonHighlightSecondary", "MasonHighlightSecondaryBold",

  -- Which-key
  "WhichKey", "WhichKeyGroup", "WhichKeyDesc", "WhichKeySeparator",
  "WhichKeyFloat", "WhichKeyValue",

  -- Lualine
  "StatusLine", "StatusLineNC", "LualineNormal", "LualineInsert", "LualineVisual",
  "LualineReplace", "LualineCommand", "LualineInactive",

  -- Bufferline
  "BufferLineFill", "BufferLineBackground", "BufferLineBuffer", "BufferLineBufferSelected",
  "BufferLineCloseButton", "BufferLineCloseButtonSelected", "BufferLineTab",
  "BufferLineTabSelected", "BufferLineSeparator", "BufferLineSeparatorSelected",
  "BufferLineIndicatorSelected",

  -- Indent Blankline
  "IndentBlanklineChar", "IndentBlanklineContextChar", "IndentBlanklineContextStart",

  -- Notify
  "NotifyERRORBorder", "NotifyWARNBorder", "NotifyINFOBorder", "NotifyDEBUGBorder",
  "NotifyTRACEBorder", "NotifyERRORIcon", "NotifyWARNIcon", "NotifyINFOIcon",
  "NotifyDEBUGIcon", "NotifyTRACEIcon", "NotifyERRORTitle", "NotifyWARNTitle",
  "NotifyINFOTitle", "NotifyDEBUGTitle", "NotifyTRACETitle", "NotifyERRORBody",
  "NotifyWARNBody", "NotifyINFOBody", "NotifyDEBUGBody", "NotifyTRACEBody",

  -- Trouble
  "TroubleText", "TroubleCount", "TroubleNormal", "TroubleIndent",
  "TroubleSignError", "TroubleSignWarning", "TroubleSignInformation",
  "TroubleSignHint",

  -- Noice
  "NoiceCmdlinePopup", "NoiceCmdlinePopupBorder", "NoiceCmdlinePopupTitle",
  "NoiceCmdlineIcon", "NoiceCmdlineIconSearch", "NoiceCmdlineIconFilter",
  "NoiceCmdlineIconLua", "NoiceCmdlinePopupBorderSearch", "NoiceCmdlinePopupBorderFilter",
  "NoiceCmdlinePopupBorderLua",

  -- Snacks (if applicable)
  "SnacksNormal", "SnacksFloat", "SnacksBorder",

  -- Other common plugin groups
  "NvimTreeNormal", "NvimTreeVertSplit", "NvimTreeIndentMarker", "NvimTreeFolderName",
  "NvimTreeRootFolder", "NvimTreeGitDirty", "NvimTreeGitNew", "NvimTreeGitDeleted",
  "NvimTreeGitRenamed", "NvimTreeGitIgnored",

  -- Markdown
  "markdownCode", "markdownCodeBlock", "markdownCodeDelimiter", "markdownHeadingDelimiter",
  "markdownHeadingRule", "markdownUrl", "markdownLinkText", "markdownLinkTitle",
  "markdownItalic", "markdownBold", "markdownCode", "markdownBlockquote",
  "markdownListMarker", "markdownOrderedListMarker", "markdownRule",

  -- Diff
  "DiffAdd", "DiffChange", "DiffDelete", "DiffText",

  -- SQL
  "sqlKeyword", "sqlFunction", "sqlOperator", "sqlIdentifier", "sqlString",

  -- Other misc
  "SpellBad", "SpellCap", "SpellLocal", "SpellRare",
}

for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end

vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#eeeeee", bg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#3a5068" })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#3a5068" })
