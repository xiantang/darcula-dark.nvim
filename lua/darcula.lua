---@class Config
local config = {
  opt = {
    integrations = {
      telescope = true,
      lualine = true,
      lsp_semantics_token = true,
      nvim_cmp = true,
      dap_nvim = true,
    },
  },
}

---@class MyModule
local M = {}

---@type Config
M.config = config

local color = {
  green = "#98be65",
  red = "#f43753",
  grey = "#C9D0D3",
  light_blue = "#b3deef",
  background = "#383838",
  pale_gold = "#d3b987",
  dark = "#2B2B2B",
  bright_sky = "#73cef4",
  golden_yellow = "#ffc24b",
  light_olive_green = "#c9d05c",
  medium_gray = "#4c4c4c",
  light_brown = "#dc9656",
  silver_gray = "#b8b8b8",
  bright_cyan = "#00f1f5",
  light_slate_gray = "#abb2bf",
  dark_grey = "#484848",
  comment = "#808080",
  light_lime_green = "#a9ff68",
  peach_orange = "#ff9e64",
  slate_gray = "#6d8086",
  light_lavender = "#cba6f7",
  very_light_gray = "#eeeeee",
  dark_charcoal_gray = "#404040",
  very_dark_gray = "#242424",
  bright_pink = "#f70067",
  burnt_orange = "#CC7832",
  dark_maroon = "#7a1b29",
  steel_blue = "#596f77",
  bright_yellow_green = "#e3e346",
  copper_brown = "#C07C41",
  deep_fuchsia = "#b33076",
  lavender = "#9876AA",
  deep_light_blue = "#51afef",
  pale_taupe = "#AD9E7D",
  olive_green = "#6A8759",
  _52 = "#c95942",
  _54 = "#bf4537",
  _64 = "#89d957",
  _70 = "#4dd158",
  _66 = "#6FAFBD",
  _71 = "#4B4E4F",
  _74 = "#3C3F40",
  _38 = "#881515",
  _39 = "#73797e",
  _47 = "#f7bb3b",
  _50 = "#d1d4cf",
  _53 = "#c955ae",
  _55 = "#b8733e",
  _56 = "#afd700",
  _57 = "#ad475f",
  _58 = "#FFC66D",
  _61 = "#AFBF7E",
  _68 = "#6897BB",
  _72 = "#4682b4",
  _75 = "#392a52",
  _82 = "#151838",
}

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  if vim.g.colors_name ~= nil then
    vim.cmd("highlight clear")
  end

  if args and type(args.override) == "function" then
    c = args.override(color)
    color = vim.tbl_deep_extend("force", color, c)
  end

  -- neovim version should be higher than 0.8.3
  if vim.fn.has("nvim-0.8.3") == 0 then
    vim.cmd(
      "echohl WarningMsg | echo 'Your neovim version is lower than 0.8.3, some features may not work correctly!' | echohl None"
    )
  end

  vim.g.colors_name = "darcula-dark"
  vim.o.termguicolors = true
  M.configure_highlights()
end

M.configure_highlights = function()
  -- colors
  -- Highlight groups
  local hi = vim.api.nvim_set_hl

  if M.config.opt.integrations.lsp_semantics_token then
    -- lsp semantics token
    hi(0, "@attribute", { link = "TSAttribute" })
    hi(0, "@boolean", { link = "TSBoolean" })
    hi(0, "@character", { link = "TSCharacter" })
    hi(0, "@character.special", { link = "SpecialChar" })
    hi(0, "@class", { link = "TSType" })
    hi(0, "@comment", { link = "TSComment" })
    hi(0, "@conditional", { link = "TSConditional" })
    hi(0, "@constant", { link = "TSConstant" })
    hi(0, "@constant.builtin", { link = "TSConstantBuiltin" })
    hi(0, "@constant.macro", { link = "TSConstant" })
    hi(0, "@constructor", { link = "TSConstructor" })
    hi(0, "@decorator", { link = "Identifier" })
    hi(0, "@enum", { link = "TSType" })
    hi(0, "@enumMember", { link = "Constant" })
    hi(0, "@error", { link = "TSError" })
    hi(0, "@event", { link = "Identifier" })
    hi(0, "@exception", { link = "TSException" })
    hi(0, "@field", { link = "TSField" })
    hi(0, "@float", { link = "TSFloat" })
    hi(0, "@function", { link = "TSFunction" })
    hi(0, "@function.builtin", { link = "TSFuncBuiltin" })
    hi(0, "@function.call", { link = "TSFunctionCall" })
    hi(0, "@function.macro", { link = "TSFuncMacro" })
    hi(0, "@include", { link = "TSInclude" })
    hi(0, "@interface", { link = "Structure" })
    hi(0, "@keyword", { link = "TSKeyword" })
    hi(0, "@keyword.function", { link = "TSKeywordFunction" })
    hi(0, "@keyword.operator", { link = "TSKeywordOperator" })
    hi(0, "@keyword.return", { link = "TSKeyword" })
    hi(0, "@label", { link = "TSLabel" })
    hi(0, "@method", { link = "TSMethod" })
    hi(0, "@method.call", { link = "TSMethodCall" })
    hi(0, "@modifier", { link = "Identifier" })
    hi(0, "@namespace", { link = "TSNamespace" })
    hi(0, "@none", { link = "TSNone" })
    hi(0, "@number", { link = "TSNumber" })
    hi(0, "@operator", { link = "TSOperator" })
    hi(0, "@parameter", { link = "TSParameter" })
    hi(0, "@property", { link = "TSVariable" })
    hi(0, "@punctuation.bracket", { link = "TSPunctBracket" })
    hi(0, "@punctuation.delimiter", { link = "TSPunctDelimiter" })
    hi(0, "@punctuation.special", { link = "TSPunctSpecial" })
    hi(0, "@regexp", { link = "TSStringRegex" })
    hi(0, "@repeat", { link = "TSRepeat" })
    hi(0, "@string", { link = "TSString" })
    hi(0, "@string.escape", { link = "TSStringEscape" })
    hi(0, "@string.regex", { link = "TSStringRegex" })
    hi(0, "@string.special", { link = "SpecialChar" })
    hi(0, "@struct", { link = "TSType" })
    hi(0, "@symbol", { link = "TSSymbol" })
    hi(0, "@tag", { link = "TSTag" })
    hi(0, "@tag.attribute", { link = "TSAttribute" })
    hi(0, "@tag.delimiter", { link = "TSTagDelimiter" })
    hi(0, "@text", { link = "TSText" })
    hi(0, "@text.danger", { link = "DiagnosticError" })
    hi(0, "@text.emphasis", { link = "TSEmphasis" })
    hi(0, "@text.environment", { link = "Macro" })
    hi(0, "@text.environment.name", { link = "Type" })
    hi(0, "@text.literal", { link = "TSLiteral" })
    hi(0, "@text.math", { link = "Number" })
    hi(0, "@text.note", { link = "Tag" })
    hi(0, "@text.reference", { link = "TSParameterReference" })
    hi(0, "@text.strike", { link = "TSStrike" })
    hi(0, "@text.strong", { link = "TSStrong" })
    hi(0, "@text.title", { link = "TSTitle" })
    hi(0, "@text.todo", { link = "Todo" })
    hi(0, "@text.underline", { link = "TSUnderline" })
    hi(0, "@text.uri", { link = "TSURI" })
    hi(0, "@text.warning", { link = "DiagnosticWarn" })
    hi(0, "@type", { link = "TSType" })
    hi(0, "@type.builtin", { link = "TSTypeBuiltin" })
    hi(0, "@type.definition", { link = "TSTypeDefinition" })
    hi(0, "@type.qualifier", { link = "TSType" })
    hi(0, "@typeParameter", { link = "Type" })
    hi(0, "@variable", { link = "TSVariable" })
    hi(0, "@variable.builtin", { link = "TSVariableBuiltin" })
    hi(0, "@lsp.type.namespace", { link = "TSNamespace" })
    hi(0, "@lsp.type.variable", { link = "TSVariable" })
    hi(0, "@lsp.type.parameter", { link = "TSVariable" })
    hi(0, "@lsp.typemod.variable.readonly", { link = "TSConstant" })
    hi(0, "@lsp.type.type", { link = "TSType" })
    hi(0, "@lsp.type.function", {})
    hi(0, "@lsp.type.method", {})
    hi(0, "@lsp.type.comment", {})
    hi(0, "@lsp.typemod.variable.defaultLibrary", { link = "TSKeyword" })
    hi(0, "@lsp.mod.defaultLibrary.go", { link = "TSKeyword" })
    hi(0, "@lsp.type.property", { link = "TSField" })
    hi(0, "@tag.attribute.tsx", { link = "TSParameter" })
    hi(0, "@tag.attribute.javascript", { link = "TSParameter" })
  end

  hi(0, "Bold", { bold = true })
  hi(0, "Boolean", { fg = color.light_brown })
  hi(0, "Character", { fg = color.red })

  -- nvim-cmp
  if M.config.opt.integrations.nvim_cmp then
    hi(0, "Pmenu", { bg = color._74, ctermbg = 13, ctermfg = 0 })
    hi(0, "PmenuSel", { bg = color._71, ctermbg = 0, ctermfg = 242 })
    hi(0, "CmpDocumentation", { fg = color.grey })
    hi(0, "CmpDocumentationBorder", { fg = color.grey })
    hi(0, "CmpItemAbbr", { fg = color.grey })
    hi(0, "CmpItemAbbrDefault", { fg = color.grey })
    hi(0, "CmpItemAbbrDeprecated", { fg = color.medium_gray, strikethrough = true })
    hi(0, "CmpItemAbbrDeprecatedDefault", { fg = color.medium_gray })
    hi(0, "CmpItemAbbrMatch", { fg = color.light_blue })
    hi(0, "CmpItemAbbrMatchDefault", { fg = color.grey })
    hi(0, "CmpItemAbbrMatchFuzzy", { fg = color.light_blue })
    hi(0, "CmpItemAbbrMatchFuzzyDefault", { fg = color.grey })
    hi(0, "CmpItemKindClass", { fg = color.golden_yellow })
    hi(0, "CmpItemKindClassDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindColorDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindConstant", { fg = color.light_brown })
    hi(0, "CmpItemKindConstantDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindConstructor", { fg = color.light_blue })
    hi(0, "CmpItemKindConstructorDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindDefault", { fg = color.bright_sky })
    hi(0, "CmpItemKindEnum", { fg = color.golden_yellow })
    hi(0, "CmpItemKindEnumDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindEnumMember", { fg = color.golden_yellow })
    hi(0, "CmpItemKindEnumMemberDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindEvent", { fg = color.golden_yellow })
    hi(0, "CmpItemKindEventDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindField", { fg = color.red })
    hi(0, "CmpItemKindFieldDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindFileDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindFolderDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindFunction", { fg = color.light_blue })
    hi(0, "CmpItemKindFunctionDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindInterface", { fg = color.golden_yellow })
    hi(0, "CmpItemKindInterfaceDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindKeyword", { fg = color.pale_gold })
    hi(0, "CmpItemKindKeywordDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindMethod", { fg = color.light_blue })
    hi(0, "CmpItemKindMethodDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindModule", { fg = color.grey })
    hi(0, "CmpItemKindModuleDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindOperator", { fg = color.grey })
    hi(0, "CmpItemKindOperatorDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindProperty", { fg = color.red })
    hi(0, "CmpItemKindPropertyDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindReference", { fg = color.red })
    hi(0, "CmpItemKindReferenceDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindSnippet", { fg = color.silver_gray })
    hi(0, "CmpItemKindSnippetDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindStruct", { fg = color.golden_yellow })
    hi(0, "CmpItemKindStructDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindTextDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindTypeParameter", { fg = color.golden_yellow })
    hi(0, "CmpItemKindTypeParameterDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindUnit", { fg = color.golden_yellow })
    hi(0, "CmpItemKindUnitDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindValue", { fg = color.light_brown })
    hi(0, "CmpItemKindValueDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemKindVariable", { fg = color.red })
    hi(0, "CmpItemKindVariableDefault", { link = "CmpItemKind" })
    hi(0, "CmpItemMenu", { fg = color.silver_gray })
    hi(0, "CmpItemMenuDefault", { fg = color.grey })
    hi(0, "ColorColumn", { bg = color.background, ctermbg = 1 })
    hi(0, "Comment", { ctermfg = 14 })
    hi(0, "Conceal", { ctermbg = 242, ctermfg = 7, fg = color.light_blue })
    hi(0, "Conditional", { fg = color.pale_gold })
  end
  -- conflict-marker.vim

  hi(0, "Constant", { ctermfg = 13, fg = color.light_brown })

  -- copilot.vim
  hi(0, "CopilotSuggestion", { ctermfg = 244, fg = color.comment })

  -- cursor
  hi(0, "Cursor", { bg = color.very_light_gray, fg = color.dark })
  hi(0, "CursorColumn", { bg = color.background, ctermbg = 242 })
  hi(0, "CursorLine", { bg = color.background })
  hi(0, "CursorLineNr", { bg = color.background, bold = true, ctermfg = 11, fg = color.silver_gray })

  -- dap.nvim
  if M.config.opt.integrations.dap_nvim then
    hi(0, "DapUIBreakpointsCurrentLine", { bold = true, fg = color.light_lime_green })
    hi(0, "DapUIBreakpointsDisabledLine", { fg = color.dark_grey })
    hi(0, "DapUIBreakpointsInfo", { fg = color.light_lime_green })
    hi(0, "DapUIBreakpointsPath", { fg = color.bright_cyan })
    hi(0, "DapUIDecoration", { fg = color.bright_cyan })
    hi(0, "DapUIFloatBorder", { fg = color.bright_cyan })
    hi(0, "DapUILineNumber", { fg = color.bright_cyan })
    hi(0, "DapUIModifiedValue", { bold = true, fg = color.bright_cyan })
    hi(0, "DapUIPlayPause", { fg = color.light_lime_green })
    hi(0, "DapUIPlayPauseNC", { fg = color.light_lime_green })
    hi(0, "DapUIRestart", { fg = color.light_lime_green })
    hi(0, "DapUIRestartNC", { fg = color.light_lime_green })
    hi(0, "DapUIScope", { fg = color.bright_cyan })
    hi(0, "DapUISource", { fg = color.light_lavender })
    hi(0, "DapUIStepBack", { fg = color.bright_cyan })
    hi(0, "DapUIStepBackNC", { fg = color.bright_cyan })
    hi(0, "DapUIStepInto", { fg = color.bright_cyan })
    hi(0, "DapUIStepIntoNC", { fg = color.bright_cyan })
    hi(0, "DapUIStepOut", { fg = color.bright_cyan })
    hi(0, "DapUIStepOutNC", { fg = color.bright_cyan })
    hi(0, "DapUIStepOver", { fg = color.bright_cyan })
    hi(0, "DapUIStepOverNC", { fg = color.bright_cyan })
    hi(0, "DapUIStop", { fg = color.bright_pink })
    hi(0, "DapUIStopNC", { fg = color.bright_pink })
    hi(0, "DapUIStoppedThread", { fg = color.bright_cyan })
    hi(0, "DapUIThread", { fg = color.light_lime_green })
    hi(0, "DapUIType", { fg = color.light_lavender })
    hi(0, "DapUIUnavailable", { fg = color.dark_grey })
    hi(0, "DapUIUnavailableNC", { fg = color.dark_grey })
    hi(0, "DapUIWatchesEmpty", { fg = color.bright_pink })
    hi(0, "DapUIWatchesError", { fg = color.bright_pink })
    hi(0, "DapUIWatchesValue", { fg = color.light_lime_green })
  end
  hi(0, "Debug", { fg = color.red })
  hi(0, "Define", { fg = color.pale_gold })
  hi(0, "DefinitionArrow", { fg = color._57 })
  hi(0, "DefinitionBorder", { fg = color.light_blue })
  hi(0, "DefinitionFile", { bg = color._82 })
  hi(0, "Definitions", { bold = true, fg = color.light_lavender })
  hi(0, "DefinitionsIcon", { fg = color.bright_yellow_green })
  hi(0, "Delimiter", { fg = color.light_brown })
  hi(0, "DiagnosticError", { ctermfg = 1, fg = color.red })
  hi(0, "DiagnosticHint", { ctermfg = 7, fg = color.bright_sky })
  hi(0, "DiagnosticInfo", { ctermfg = 4, fg = color.grey })
  hi(0, "DiagnosticLineCol", { fg = color._39 })
  hi(0, "DiagnosticMap", { fg = color.light_lavender })
  hi(0, "DiagnosticQuickFix", { bold = true, fg = color._70 })
  hi(0, "DiagnosticUnderlineError", { sp = color.red, undercurl = true })
  hi(0, "DiagnosticUnderlineHint", { sp = color.bright_sky, undercurl = true })
  hi(0, "DiagnosticUnderlineInformation", { sp = color.light_brown, undercurl = true })
  hi(0, "DiagnosticUnderlineWarn", { sp = color.pale_gold, undercurl = true })
  hi(0, "DiagnosticUnderlineWarning", { sp = color.pale_gold, undercurl = true })
  hi(0, "DiagnosticWarn", { ctermfg = 3, fg = color.pale_gold })
  -- hi(0, "DiffAdd", { ctermbg = 4, fg = color._05 })
  -- hi(0, "DiffAdded", { fg = color._05 })
  -- hi(0, "DiffChange", { ctermbg = 5, fg = color._07 })
  -- hi(0, "DiffDelete", { bold = true, ctermbg = 6, ctermfg = 12, fg = color.red })
  -- hi(0, "DiffFile", { fg = color.red })
  -- hi(0, "DiffLine", { fg = color.light_blue })
  -- hi(0, "DiffNewFile", { fg = color._05 })
  -- hi(0, "DiffRemoved", { fg = color.red })
  -- hi(0, "DiffText", { bold = true, ctermbg = 9, fg = color.light_blue })
  hi(0, "Directory", { ctermfg = 159, fg = color.light_blue })
  hi(0, "Error", { bg = color.red, ctermbg = 9, ctermfg = 15, fg = color.dark })
  hi(0, "ErrorMsg", { ctermbg = 1, ctermfg = 15, fg = color.red })
  hi(0, "Exception", { fg = color.red })
  hi(0, "EyelinerDimmed", { fg = color.medium_gray })
  hi(0, "EyelinerPrimary", { fg = color.light_brown })
  hi(0, "EyelinerSecondary", { fg = color.pale_gold })
  hi(0, "FinderParam", { bg = color._75, bold = true, fg = color.light_lavender })
  hi(0, "FinderSpinner", { bold = true, fg = color.deep_fuchsia })
  hi(0, "FinderSpinnerBorder", { fg = color.deep_light_blue })
  hi(0, "FinderSpinnerTitle", { bold = true, fg = color.deep_fuchsia })
  hi(0, "FinderVirtText", { fg = color._52 })
  hi(0, "Float", { fg = color.light_brown })
  hi(0, "FloatBorder", { fg = color.grey })
  hi(0, "FocusedSymbol", { bg = color.background, fg = color.light_olive_green })
  hi(0, "FoldColumn", { ctermbg = 242 })
  hi(0, "Folded", { bg = color.background, ctermbg = 242 })
  hi(0, "Function", { fg = color.light_blue })
  hi(0, "GitGutterAdd", { bg = color.dark, fg = color.light_olive_green })
  hi(0, "GitGutterChange", { bg = color.dark, fg = color.light_blue })
  hi(0, "GitGutterChangeDelete", { bg = color.dark, fg = color.pale_gold })
  hi(0, "GitGutterDelete", { bg = color.dark, fg = color.red })
  hi(0, "GitSignsStagedAdd", { bg = color.dark, fg = color.green })
  hi(0, "GitSignsStagedAddLn", { bg = color.dark, fg = color.green })
  hi(0, "GitSignsStagedAddNr", { bg = color.dark, fg = color.green })
  hi(0, "GitSignsStagedChange", { bg = color.dark, fg = color.steel_blue })
  hi(0, "GitSignsStagedChangeLn", { bg = color.dark, fg = color.very_dark_gray })
  hi(0, "GitSignsStagedChangeNr", { bg = color.dark, fg = color.steel_blue })
  hi(0, "GitSignsStagedChangedelete", { bg = color.dark, fg = color.steel_blue })
  hi(0, "GitSignsStagedChangedeleteLn", { bg = color.dark, fg = color.very_dark_gray })
  hi(0, "GitSignsStagedChangedeleteNr", { bg = color.dark, fg = color.steel_blue })
  hi(0, "GitSignsStagedDelete", { bg = color.dark, fg = color.dark_maroon })
  hi(0, "GitSignsStagedDeleteNr", { bg = color.dark, fg = color.dark_maroon })
  hi(0, "GitSignsStagedTopdelete", { bg = color.dark, fg = color.dark_maroon })
  hi(0, "GitSignsStagedTopdeleteNr", { bg = color.dark, fg = color.dark_maroon })
  hi(0, "HopNextKey", { bold = true, ctermfg = 198, fg = color.bright_pink })
  hi(0, "HopNextKey1", { bold = true, ctermfg = 45, fg = color.bright_cyan })
  hi(0, "HopNextKey2", { ctermfg = 33, fg = color.bright_cyan })
  hi(0, "HopPreview", { link = "IncSearch" })
  hi(0, "HopUnmatched", { ctermfg = 242, fg = color.slate_gray, sp = color.slate_gray })
  hi(0, "Identifier", { ctermfg = 14, fg = color.red })
  hi(0, "Ignore", { ctermfg = 0, fg = color.dark })
  -- hi(0, "IlluminatedWordRead", { sp = color._09, underline = true })
  -- hi(0, "IlluminatedWordText", { sp = color._09, underline = true })
  -- hi(0, "IlluminatedWordWrite", { sp = color._09, underline = true })
  hi(0, "Implements", { bold = true, fg = color.light_lavender })
  hi(0, "ImplementsIcon", { fg = color.bright_yellow_green })
  hi(0, "IncSearch", { bg = color.light_brown, fg = color.background })
  hi(0, "Include", { fg = color.copper_brown })
  hi(0, "IndentBlanklineChar", { fg = color.dark_grey, nocombine = true })
  hi(0, "IndentBlanklineContextChar", { fg = color.silver_gray, nocombine = true })
  hi(0, "IndentBlanklineContextStart", { sp = color.golden_yellow, underline = true })
  hi(0, "IndentBlanklineSpaceChar", { ctermfg = 12, fg = color.medium_gray, nocombine = true })
  hi(0, "IndentBlanklineSpaceCharBlankline", { ctermfg = 12, fg = color.medium_gray, nocombine = true })
  hi(0, "Keyword", { fg = color.pale_gold })
  hi(0, "LSOutlinePreviewBorder", { fg = color.green })
  hi(0, "Label", { fg = color.golden_yellow })
  hi(0, "LineNr", { ctermfg = 11, fg = color.silver_gray })
  hi(0, "LspDiagnosticsDefaultError", { link = "DiagnosticError" })
  hi(0, "LspDiagnosticsDefaultHint", { link = "DiagnosticHint" })
  hi(0, "LspDiagnosticsDefaultInformation", { link = "DiagnosticInfo" })
  hi(0, "LspDiagnosticsDefaultWarning", { link = "DiagnosticWarn" })
  hi(0, "LspDiagnosticsUnderlineError", { link = "DiagnosticUnderlineError" })
  hi(0, "LspDiagnosticsUnderlineHint", { link = "DiagnosticUnderlineHint" })
  hi(0, "LspDiagnosticsUnderlineInformation", { link = "DiagnosticUnderlineInformation" })
  hi(0, "LspDiagnosticsUnderlineWarning", { link = "DiagnosticUnderlineWarning" })
  hi(0, "LspReferenceRead", { sp = color.silver_gray, underline = true })
  hi(0, "LspReferenceText", { sp = color.silver_gray, underline = true })
  hi(0, "LspReferenceWrite", { sp = color.silver_gray, underline = true })
  hi(0, "LspSagaAutoPreview", { fg = color.deep_light_blue })
  hi(0, "LspSagaCodeActionBorder", { fg = color.light_lavender })
  hi(0, "LspSagaCodeActionContent", { bold = true, fg = color.green })
  hi(0, "LspSagaCodeActionTitle", { bold = true, fg = color.burnt_orange })
  hi(0, "LspSagaDiagnosticBorder", { fg = color.light_lavender })
  hi(0, "LspSagaDiagnosticHeader", { fg = color._56 })
  hi(0, "LspSagaFinderSelection", { bold = true, fg = color._64 })
  hi(0, "LspSagaHoverBorder", { fg = color._47 })
  hi(0, "LspSagaLspFinderBorder", { fg = color.deep_light_blue })
  hi(0, "LspSagaRenameBorder", { fg = color.bright_cyan })
  hi(0, "LspSagaSignatureHelpBorder", { fg = color.green })
  hi(0, "Macro", { fg = color.red })
  hi(0, "MatchParen", { fg = color.bright_cyan, bold = true })
  hi(0, "ModeMsg", { bold = true, fg = color.light_olive_green })
  hi(0, "MoreMsg", { bold = true, ctermfg = 121, fg = color.light_olive_green })
  hi(0, "NERDTreeFile", { fg = color.grey })
  hi(0, "NERDTreeCWD", { fg = color.grey })
  hi(0, "NERDTreeGitStatusIgnored", { ctermfg = 81, fg = color.medium_gray })
  hi(0, "NERDTreeGitStatusModified", { ctermfg = 224, fg = color.bright_sky })
  hi(0, "NERDTreeGitStatusRenamed", { ctermfg = 225, fg = color.light_blue })
  hi(0, "NERDTreeGitStatusUntracked", { ctermfg = 14, fg = color.medium_gray })
  hi(0, "NonText", { bold = true, ctermfg = 12, fg = color.medium_gray })
  hi(0, "Normal", { bg = color.dark, fg = color.grey })
  hi(0, "NormalFloat", { fg = color.grey })
  hi(0, "NormalNC", { fg = color.grey })
  hi(0, "NotifyDEBUGBody", { link = "Normal" })
  hi(0, "NotifyDEBUGBorder", { fg = color.bright_sky })
  hi(0, "NotifyDEBUGIcon", { fg = color.bright_sky })
  hi(0, "NotifyDEBUGTitle", { fg = color.bright_sky })
  hi(0, "NotifyERRORBody", { link = "Normal" })
  hi(0, "NotifyERRORBorder", { fg = color.red })
  hi(0, "NotifyERRORIcon", { fg = color.red })
  hi(0, "NotifyERRORTitle", { fg = color.red })
  hi(0, "NotifyINFOBody", { link = "Normal" })
  hi(0, "NotifyINFOBorder", { fg = color.grey })
  hi(0, "NotifyINFOIcon", { fg = color.grey })
  hi(0, "NotifyINFOTitle", { fg = color.grey })
  hi(0, "NotifyTRACEBody", { link = "Normal" })
  hi(0, "NotifyTRACEBorder", { fg = color.bright_sky })
  hi(0, "NotifyTRACEIcon", { fg = color.bright_sky })
  hi(0, "NotifyTRACETitle", { fg = color.bright_sky })
  hi(0, "NotifyWARNBody", { link = "Normal" })
  hi(0, "NotifyWARNBorder", { fg = color.pale_gold })
  hi(0, "NotifyWARNIcon", { fg = color.pale_gold })
  hi(0, "NotifyWARNTitle", { fg = color.pale_gold })
  hi(0, "Number", { fg = color.light_brown })
  hi(0, "NvimInternalError", { bg = color.red, ctermbg = 9, ctermfg = 9, fg = color.dark })
  hi(0, "Operator", { fg = color.grey })
  hi(0, "OutlineDetail", { fg = color._39 })
  hi(0, "OutlineFoldPrefix", { fg = color._54 })
  hi(0, "OutlineIndentEvn", { fg = color._53 })
  hi(0, "OutlineIndentOdd", { fg = color._55 })
  hi(0, "PreProc", { ctermfg = 81, fg = color.golden_yellow })
  hi(0, "Question", { bold = true, ctermfg = 121, fg = color.light_blue })
  hi(0, "QuickFixLine", { bg = color.background })
  hi(0, "References", { bold = true, fg = color.light_lavender })
  hi(0, "ReferencesIcon", { fg = color.bright_yellow_green })
  hi(0, "Repeat", { fg = color.golden_yellow })
  hi(0, "SagaShadow", { fg = color.dark })
  hi(0, "ScrollbarCursor", { ctermfg = 0, fg = color.grey })
  hi(0, "ScrollbarCursorHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.grey })
  hi(0, "ScrollbarError", { ctermfg = 0, fg = color.red })
  hi(0, "ScrollbarErrorHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.red })
  hi(0, "ScrollbarGitAdd", { ctermfg = 0, fg = color.green })
  hi(0, "ScrollbarGitAddHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.green })
  hi(0, "ScrollbarGitChange", { ctermfg = 0, fg = color.bright_yellow_green })
  hi(
    0,
    "ScrollbarGitChangeHandle",
    { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.bright_yellow_green }
  )
  hi(0, "ScrollbarGitDelete", { ctermfg = 0, fg = color.red })
  hi(0, "ScrollbarGitDeleteHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.red })
  hi(0, "ScrollbarHandle", { bg = color.background, ctermbg = 15 })
  hi(0, "ScrollbarHint", { ctermfg = 0, fg = color.bright_sky })
  hi(0, "ScrollbarHintHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.bright_sky })
  hi(0, "ScrollbarInfo", { ctermfg = 0, fg = color.grey })
  hi(0, "ScrollbarInfoHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.grey })
  hi(0, "ScrollbarMisc", { ctermfg = 0, fg = color.grey })
  hi(0, "ScrollbarMiscHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.grey })
  hi(0, "ScrollbarSearch", { ctermfg = 0, fg = color.background })
  hi(0, "ScrollbarSearchHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.background })
  hi(0, "ScrollbarWarn", { ctermfg = 0, fg = color.pale_gold })
  hi(0, "ScrollbarWarnHandle", { bg = color.background, ctermbg = 15, ctermfg = 0, fg = color.pale_gold })
  hi(0, "Search", { bg = color.golden_yellow, ctermbg = 11, ctermfg = 0, fg = color.background })
  hi(0, "SignColumn", { ctermbg = 242, ctermfg = 14, fg = color.silver_gray })
  hi(0, "SniprunFloatingWinErr", { ctermfg = 1, fg = color._38 })
  hi(0, "SniprunFloatingWinOk", { ctermfg = 14, fg = color.bright_cyan })
  hi(0, "SniprunVirtualTextErr", { bg = color._38, ctermbg = 1, fg = color.dark })
  hi(0, "SniprunVirtualTextOk", { bg = color.bright_cyan, ctermbg = 14, fg = color.dark })
  hi(0, "Special", { ctermfg = 224, fg = color.bright_sky })
  hi(0, "SpecialChar", { fg = color.light_brown })
  hi(0, "SpecialKey", { ctermfg = 81, fg = color.medium_gray })
  hi(0, "SpellBad", { ctermbg = 9, sp = color.red, undercurl = true })
  hi(0, "SpellCap", { ctermbg = 12, sp = color.light_blue, undercurl = true })
  hi(0, "SpellLocal", { ctermbg = 14, sp = color.bright_sky, undercurl = true })
  hi(0, "SpellRare", { ctermbg = 13, sp = color.pale_gold, undercurl = true })
  hi(0, "Statement", { bold = true, ctermfg = 11, fg = color.red })
  hi(0, "StatusLine", { bg = color.dark_grey, fg = color.grey })
  hi(0, "StatusLineNC", { bg = color.background, fg = color.silver_gray })
  hi(0, "StorageClass", { fg = color.golden_yellow })
  hi(0, "String", { fg = color.light_olive_green })
  hi(0, "Structure", { fg = color.pale_gold })
  hi(0, "Substitute", { bg = color.golden_yellow, fg = color.background })
  hi(0, "SymbolsOutlineConnector", { fg = color.medium_gray })
  hi(0, "TSAnnotation", { fg = color.light_brown })
  hi(0, "TSAttribute", { fg = color.golden_yellow })
  hi(0, "TSBoolean", { fg = color.light_brown })
  hi(0, "TSCharacter", { fg = color.red })
  hi(0, "TSComment", { fg = color.comment, italic = true })
  hi(0, "GitSignsCurrentLineBlame", { fg = color.comment, italic = true })
  hi(0, "TSConditional", { fg = color.burnt_orange })
  hi(0, "TSConstBuiltin", { fg = color.light_brown, italic = true })
  hi(0, "TSMethodCall", { fg = color.pale_taupe })
  hi(0, "TSFunctionCall", { fg = color.pale_taupe })
  hi(0, "TSConstMacro", { fg = color.red })
  hi(0, "TSConstant", { fg = color.lavender })
  hi(0, "TSConstructor", { fg = color.light_blue })
  hi(0, "TSCurrentScope", { bold = true })
  hi(0, "TSDefinition", { sp = color.silver_gray, underline = true })
  hi(0, "TSDefinitionUsage", { sp = color.silver_gray, underline = true })
  hi(0, "TSEmphasis", { fg = color.light_brown, italic = true })
  hi(0, "TSError", { fg = color.red })
  hi(0, "TSException", { fg = color.red })
  hi(0, "TSField", { fg = color.grey })
  hi(0, "TSFloat", { fg = color.light_brown })
  hi(0, "TSFuncBuiltin", { fg = color.burnt_orange, italic = true })
  hi(0, "TSFuncMacro", { fg = color.red })
  hi(0, "TSFunction", { fg = color._58 })
  hi(0, "TSInclude", { fg = color.copper_brown })
  hi(0, "TSKeyword", { fg = color.burnt_orange })
  hi(0, "TSKeywordFunction", { fg = color.burnt_orange })
  hi(0, "TSKeywordOperator", { fg = color.pale_gold })
  hi(0, "TSLabel", { fg = color.lavender })
  hi(0, "TSLiteral", { fg = color.light_brown })
  hi(0, "TSMethod", { fg = color.pale_gold })
  hi(0, "TSNamespace", { fg = color._61 })
  hi(0, "TSNone", { fg = color.grey })
  hi(0, "TSNumber", { fg = color._68 })
  hi(0, "TSConstantBuiltin", { fg = color.copper_brown })
  hi(0, "TSOperator", { fg = color.grey })
  hi(0, "TSParameter", { fg = color.grey })
  hi(0, "TSParameterReference", { fg = color.grey })
  hi(0, "TSProperty", { fg = color.pale_gold })
  hi(0, "TSPunctBracket", { fg = color.grey })
  hi(0, "TSPunctDelimiter", { fg = color.light_brown })
  hi(0, "TSPunctSpecial", { fg = color.grey })
  hi(0, "TSRepeat", { fg = color.pale_gold })
  hi(0, "TSStrike", { fg = color.dark, strikethrough = true })
  hi(0, "TSString", { fg = color.olive_green })
  hi(0, "TSStringEscape", { fg = color.bright_sky })
  hi(0, "TSStringRegex", { fg = color.bright_sky })
  hi(0, "TSStrong", { bold = true })
  hi(0, "TSSymbol", { fg = color.light_olive_green })
  hi(0, "TSTag", { fg = color.golden_yellow })
  hi(0, "TSTagDelimiter", { fg = color.light_brown })
  hi(0, "TSText", { fg = color.grey })
  hi(0, "TSTitle", { fg = color.light_blue })
  hi(0, "TSType", { fg = color._66 })

  hi(0, "TSTypeDefinition", { fg = color.grey })
  hi(0, "TSTypeBuiltin", { fg = color.burnt_orange, italic = true })
  hi(0, "TSURI", { fg = color.light_brown, underline = true })
  hi(0, "TSUnderline", { fg = color.dark, underline = true })
  hi(0, "TSVariable", { fg = color.grey })
  hi(0, "TSVariableBuiltin", { fg = color.burnt_orange, italic = true })
  hi(0, "TabLine", { bg = color.background, ctermbg = 242, ctermfg = 15, fg = color.medium_gray })
  hi(0, "TabLineFill", { bg = color.background, fg = color.medium_gray })
  hi(0, "TabLineSel", { bg = color.background, fg = color.light_olive_green })
  hi(0, "Tag", { fg = color.golden_yellow })
  hi(0, "TargetFileName", { fg = color._50 })
  -- telescope
  if M.config.opt.integrations.telescope then
    hi(0, "TelescopeBorder", { bg = color.very_dark_gray, fg = color.very_dark_gray })
    hi(0, "TelescopeNormal", { bg = color.very_dark_gray })
    hi(0, "TelescopePreviewLine", { bg = color.background })
    hi(0, "TelescopePreviewTitle", { bg = color.light_olive_green, fg = color.very_dark_gray })
    hi(0, "TelescopePromptBorder", { bg = color.dark_charcoal_gray, fg = color.dark_charcoal_gray })
    hi(0, "TelescopePromptNormal", { bg = color.dark_charcoal_gray, fg = color.grey })
    hi(0, "TelescopePromptPrefix", { bg = color.dark_charcoal_gray, fg = color.red })
    hi(0, "TelescopePromptTitle", { bg = color.red, fg = color.very_dark_gray })
    hi(0, "TelescopeResultsTitle", { bg = color.very_dark_gray, fg = color.very_dark_gray })
    hi(0, "TelescopeSelection", { bg = color.dark_charcoal_gray })
  end

  hi(0, "TermCursor", { bg = color.very_light_gray, fg = color.dark })
  hi(0, "TermCursorNC", { bg = color.very_light_gray, fg = color.dark })
  hi(0, "Title", { ctermfg = 225, fg = color.light_blue })
  hi(0, "Todo", { bg = color.background, ctermbg = 11, ctermfg = 0, fg = color.golden_yellow })
  hi(0, "TooLong", { fg = color.red })
  hi(0, "TreesitterContext", { bg = color.background, italic = true })
  hi(0, "Type", { ctermfg = 121, fg = color.golden_yellow })
  hi(0, "Typedef", { fg = color.golden_yellow })
  hi(0, "Underlined", { ctermfg = 81, fg = color.red, underline = true })
  hi(0, "User1", { bg = color.dark_grey, fg = color.red })
  hi(0, "User2", { bg = color.dark_grey, fg = color.pale_gold })
  hi(0, "User3", { bg = color.dark_grey, fg = color.grey })
  hi(0, "User4", { bg = color.dark_grey, fg = color.bright_sky })
  hi(0, "User5", { bg = color.dark_grey, fg = color.grey })
  hi(0, "User6", { bg = color.background, fg = color.grey })
  hi(0, "User7", { bg = color.dark_grey, fg = color.grey })
  hi(0, "User8", { bg = color.dark_grey, fg = color.dark })
  hi(0, "User9", { bg = color.dark_grey, fg = color.dark })
  hi(0, "VertSplit", { fg = color.grey })
  hi(0, "WinSeparator", { fg = color.grey })
  hi(0, "Visual", { bg = color.dark_grey, ctermbg = 242 })
  hi(0, "VisualNOS", { fg = color.red })
  hi(0, "WarningMsg", { ctermfg = 224, fg = color.red })
  hi(0, "WildMenu", { bg = color.golden_yellow, ctermbg = 11, ctermfg = 0, fg = color.red })
  hi(0, "WinBar", { fg = color.grey })
  hi(0, "WinBarNC", { fg = color.silver_gray })
  hi(0, "gitcommitBranch", { bold = true, fg = color.light_brown })
  hi(0, "gitcommitComment", { fg = color.medium_gray })
  hi(0, "gitcommitDiscarded", { fg = color.medium_gray })
  hi(0, "gitcommitDiscardedFile", { bold = true, fg = color.red })
  hi(0, "gitcommitDiscardedType", { fg = color.light_blue })
  hi(0, "gitcommitHeader", { fg = color.pale_gold })
  hi(0, "gitcommitOverflow", { fg = color.red })
  hi(0, "gitcommitSelected", { fg = color.medium_gray })
  hi(0, "gitcommitSelectedFile", { bold = true, fg = color.light_olive_green })
  hi(0, "gitcommitSelectedType", { fg = color.light_blue })
  hi(0, "gitcommitSummary", { fg = color.light_olive_green })
  hi(0, "gitcommitUnmergedFile", { bold = true, fg = color.red })
  hi(0, "gitcommitUnmergedType", { fg = color.light_blue })
  hi(0, "gitcommitUntracked", { fg = color.medium_gray })
  hi(0, "gitcommitUntrackedFile", { fg = color.golden_yellow })
  hi(0, "iCursor", { bg = color._72, fg = color.very_light_gray })
  hi(0, "lCursor", { bg = color.very_light_gray, fg = color.dark })

  if M.config.opt.integrations.lualine then
    hi(0, "lualine_a_command", { bg = color.green, bold = true, fg = color.dark })
    hi(0, "lualine_a_inactive", { bg = color.light_slate_gray, bold = true, fg = color.dark })
    hi(0, "lualine_a_insert", { bg = color.green, bold = true, fg = color.dark })
    hi(0, "lualine_a_normal", { bg = color.green, bold = true, fg = color.dark })
    hi(0, "lualine_a_replace", { bg = color.green, bold = true, fg = color.dark })
    hi(0, "lualine_a_visual", { bg = color.green, bold = true, fg = color.dark })
    hi(0, "lualine_b_command", { bg = color.green, fg = color.dark })
    hi(0, "lualine_b_diagnostics_error_command", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diagnostics_error_inactive", { bg = color.light_slate_gray, fg = color.red })
    hi(0, "lualine_b_diagnostics_error_insert", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diagnostics_error_normal", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diagnostics_error_replace", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diagnostics_error_terminal", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diagnostics_error_visual", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diagnostics_hint_command", { bg = color.green, fg = color.bright_sky })
    hi(0, "lualine_b_diagnostics_hint_inactive", { bg = color.light_slate_gray, fg = color.bright_sky })
    hi(0, "lualine_b_diagnostics_hint_insert", { bg = color.green, fg = color.bright_sky })
    hi(0, "lualine_b_diagnostics_hint_normal", { bg = color.green, fg = color.bright_sky })
    hi(0, "lualine_b_diagnostics_hint_replace", { bg = color.green, fg = color.bright_sky })
    hi(0, "lualine_b_diagnostics_hint_terminal", { bg = color.green, fg = color.bright_sky })
    hi(0, "lualine_b_diagnostics_hint_visual", { bg = color.green, fg = color.bright_sky })
    hi(0, "lualine_b_diagnostics_info_command", { bg = color.green, fg = color.grey })
    hi(0, "lualine_b_diagnostics_info_inactive", { bg = color.light_slate_gray, fg = color.grey })
    hi(0, "lualine_b_diagnostics_info_insert", { bg = color.green, fg = color.grey })
    hi(0, "lualine_b_diagnostics_info_normal", { bg = color.green, fg = color.grey })
    hi(0, "lualine_b_diagnostics_info_replace", { bg = color.green, fg = color.grey })
    hi(0, "lualine_b_diagnostics_info_terminal", { bg = color.green, fg = color.grey })
    hi(0, "lualine_b_diagnostics_info_visual", { bg = color.green, fg = color.grey })
    hi(0, "lualine_b_diagnostics_warn_command", { bg = color.green, fg = color.pale_gold })
    hi(0, "lualine_b_diagnostics_warn_inactive", { bg = color.light_slate_gray, fg = color.pale_gold })
    hi(0, "lualine_b_diagnostics_warn_insert", { bg = color.green, fg = color.pale_gold })
    hi(0, "lualine_b_diagnostics_warn_normal", { bg = color.green, fg = color.pale_gold })
    hi(0, "lualine_b_diagnostics_warn_replace", { bg = color.green, fg = color.pale_gold })
    hi(0, "lualine_b_diagnostics_warn_terminal", { bg = color.green, fg = color.pale_gold })
    hi(0, "lualine_b_diagnostics_warn_visual", { bg = color.green, fg = color.pale_gold })
    hi(0, "lualine_b_diff_added_command", { bg = color.green, fg = color.light_olive_green })
    hi(0, "lualine_b_diff_added_inactive", { bg = color.light_slate_gray, fg = color.light_olive_green })
    hi(0, "lualine_b_diff_added_insert", { bg = color.green, fg = color.light_olive_green })
    hi(0, "lualine_b_diff_added_normal", { bg = color.green, fg = color.light_olive_green })
    hi(0, "lualine_b_diff_added_replace", { bg = color.green, fg = color.light_olive_green })
    hi(0, "lualine_b_diff_added_terminal", { bg = color.green, fg = color.light_olive_green })
    hi(0, "lualine_b_diff_added_visual", { bg = color.green, fg = color.light_olive_green })
    hi(0, "lualine_b_diff_modified_command", { bg = color.green, fg = color.light_blue })
    hi(0, "lualine_b_diff_modified_inactive", { bg = color.light_slate_gray, fg = color.light_blue })
    hi(0, "lualine_b_diff_modified_insert", { bg = color.green, fg = color.light_blue })
    hi(0, "lualine_b_diff_modified_normal", { bg = color.green, fg = color.light_blue })
    hi(0, "lualine_b_diff_modified_replace", { bg = color.green, fg = color.light_blue })
    hi(0, "lualine_b_diff_modified_terminal", { bg = color.green, fg = color.light_blue })
    hi(0, "lualine_b_diff_modified_visual", { bg = color.green, fg = color.light_blue })
    hi(0, "lualine_b_diff_removed_command", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diff_removed_inactive", { bg = color.light_slate_gray, fg = color.red })
    hi(0, "lualine_b_diff_removed_insert", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diff_removed_normal", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diff_removed_replace", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diff_removed_terminal", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_diff_removed_visual", { bg = color.green, fg = color.red })
    hi(0, "lualine_b_inactive", { bg = color.light_slate_gray, fg = color.dark })
    hi(0, "lualine_b_insert", { bg = color.green, fg = color.dark })
    hi(0, "lualine_b_normal", { bg = color.green, fg = color.dark })
    hi(0, "lualine_b_replace", { bg = color.green, fg = color.dark })
    hi(0, "lualine_b_visual", { bg = color.green, fg = color.dark })
    hi(0, "lualine_c_command", { bg = color.green, fg = color.dark })
    hi(0, "lualine_c_inactive", { bg = color.light_slate_gray, fg = color.dark })
    hi(0, "lualine_c_insert", { bg = color.green, fg = color.dark })
    hi(0, "lualine_c_normal", { bg = color.green, fg = color.dark })
    hi(0, "lualine_c_replace", { bg = color.green, fg = color.dark })
    hi(0, "lualine_c_visual", { bg = color.green, fg = color.dark })
    hi(0, "lualine_x_2_command", { bg = color.green, fg = color.peach_orange })
    hi(0, "lualine_x_2_inactive", { bg = color.light_slate_gray, fg = color.peach_orange })
    hi(0, "lualine_x_2_insert", { bg = color.green, fg = color.peach_orange })
    hi(0, "lualine_x_2_normal", { bg = color.green, fg = color.peach_orange })
    hi(0, "lualine_x_2_replace", { bg = color.green, fg = color.peach_orange })
    hi(0, "lualine_x_2_terminal", { bg = color.green, fg = color.peach_orange })
    hi(0, "lualine_x_2_visual", { bg = color.green, fg = color.peach_orange })
    hi(0, "lualine_x_filetype_DevIconDefault_command", { bg = color.green, fg = color.slate_gray })
    hi(0, "lualine_x_filetype_DevIconDefault_inactive", { bg = color.light_slate_gray, fg = color.slate_gray })
    hi(0, "lualine_x_filetype_DevIconDefault_insert", { bg = color.green, fg = color.slate_gray })
    hi(0, "lualine_x_filetype_DevIconDefault_normal", { bg = color.green, fg = color.slate_gray })
    hi(0, "lualine_x_filetype_DevIconDefault_replace", { bg = color.green, fg = color.slate_gray })
    hi(0, "lualine_x_filetype_DevIconDefault_terminal", { bg = color.green, fg = color.slate_gray })
    hi(0, "lualine_x_filetype_DevIconDefault_visual", { bg = color.green, fg = color.slate_gray })
  end

  -- nvim-ts-rainbow
  hi(0, "rainbowcol1", { fg = color.very_light_gray })
  hi(0, "rainbowcol2", { fg = color.light_brown })
  hi(0, "rainbowcol3", { fg = color.golden_yellow })
  hi(0, "rainbowcol4", { fg = color.very_light_gray })
  hi(0, "rainbowcol5", { fg = color.bright_sky })
  hi(0, "rainbowcol6", { fg = color.light_blue })
  hi(0, "rainbowcol7", { fg = color.pale_gold })

  hi(0, "@lsp.type.keyword.go", { link = "TSKeyword" })
  hi(0, "@lsp.type.string.go", { link = "TSString" })
  hi(0, "Statement", { link = "TSKeyword" })
  hi(0, "Comment", { link = "TSComment" })
  hi(0, "Number", { link = "TSNumber" })
  hi(0, "String", { link = "TSString" })
  hi(0, "goImportString", { link = "TSString" })
  hi(0, "@lsp.type.function", { link = "TSMethodCall" })
  hi(0, "@lsp.typemod.function.definition", { link = "TSFunction" })
  hi(0, "@lsp.type.method", { link = "TSMethod" })
  hi(0, "goBlock", { link = "TSVariable" })
  hi(0, "Identifier", { link = "TSKeyword" })
  -- Terminal colors
  local g = vim.g

  g.terminal_color_0 = color.dark
  g.terminal_color_1 = color.red
  g.terminal_color_2 = color.light_olive_green
  g.terminal_color_3 = color.golden_yellow
  g.terminal_color_4 = color.light_blue
  g.terminal_color_5 = color.pale_gold
  g.terminal_color_6 = color.bright_sky
  g.terminal_color_7 = color.very_light_gray
  g.terminal_color_8 = color.medium_gray
  g.terminal_color_9 = color.red
  g.terminal_color_10 = color.light_olive_green
  g.terminal_color_11 = color.golden_yellow
  g.terminal_color_12 = color.light_blue
  g.terminal_color_13 = color.pale_gold
  g.terminal_color_14 = color.bright_sky
  g.terminal_color_15 = color.very_light_gray

  -- Snacks Dashboard
  hi(0, "SnacksDashboardHeader", { fg = color.golden_yellow, bold = true })
  hi(0, "SnacksDashboardTitle", { fg = color.pale_gold, bold = true })
  hi(0, "SnacksDashboardIcon", { fg = color.light_blue })
  hi(0, "SnacksDashboardDesc", { fg = color.light_slate_gray })
  hi(0, "SnacksDashboardFile", { fg = color.pale_gold, bold = true })
  hi(0, "SnacksDashboardKey", { fg = color.burnt_orange })
  hi(0, "SnacksDashboardSpecial", { fg = color.light_slate_gray })
  hi(0, "SnacksDashboardDir", { fg = color.light_slate_gray })
  hi(0, "SnacksDashboardNormal", { fg = color.light_slate_gray })
  hi(0, "SnacksDashboardTerminal", { fg = color.light_slate_gray })
  hi(0, "SnacksDashboardFooter", { fg = color.light_slate_gray })

  -- Neo-Tree
  hi(0, "NeoTreeFileName", { fg = color.light_slate_gray })
  hi(0, "NeoTreeDotfile", { fg = color.comment })
  hi(0, "NeoTreeDirectoryName", { fg = color.pale_gold })
  hi(0, "NeoTreeDirectoryIcon", { fg = color.pale_gold })
  hi(0, "NeoTreeGitModified", { fg = color.burnt_orange })
  hi(0, "NeoTreeGitStaged", { fg = color.olive_green })
  hi(0, "NeoTreeGitUntracked", { fg = color.lavender })
  hi(0, "NeoTreeNormal", { fg = color.light_slate_gray, bg = color.very_dark_gray })
  hi(0, "NeoTreeNormalNC", { fg = color.light_slate_gray, bg = color.very_dark_gray })
  hi(0, "NeoTreeTabActive", { fg = color.light_slate_gray, bg = color.very_dark_gray, bold = true })
  hi(0, "NeoTreeTabInactive", { fg = color.dark_grey, bg = color.very_dark_gray })
  hi(0, "NeoTreeTabSeparatorActive", { fg = color.light_slate_gray, bg = color.very_dark_gray })
  hi(0, "NeoTreeTabSeparatorInactive", { fg = color.light_slate_gray, bg = color.dark_grey })
end

return M
