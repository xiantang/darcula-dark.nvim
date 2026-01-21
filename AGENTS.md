# AGENTS.md - Darcula Dark Neovim Colorscheme

Guidelines for AI agents working on this codebase.

## Project Overview

Darcula Dark is a Neovim colorscheme plugin that emulates JetBrains' Darcula theme.
Built with Lua, it requires Neovim v0.8.3+ and nvim-treesitter for proper highlighting.
Based on [ellisonleao/nvim-plugin-template](https://github.com/ellisonleao/nvim-plugin-template).

## Project Structure

```
darcula-dark.nvim/
├── colors/darcula-dark.lua   # Neovim colorscheme entry point
├── lua/darcula.lua           # Core implementation (~670 lines) - ALL highlights here
├── lua/test.lua              # Simple test script
├── .github/workflows/        # CI/CD (lint, test, release, docs)
├── Makefile                  # Test commands
└── .stylua.toml              # Lua formatter config
```

## Build/Lint/Test Commands

### Linting (Stylua)
```bash
stylua --check lua   # Check formatting (CI uses this)
stylua lua           # Auto-fix formatting
```

### Testing (Plenary.nvim)
```bash
make test            # Run all tests

# Run a single test file
nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/specific_test.lua"
```
**Note:** `tests/` directory doesn't exist yet (inherited from template).

### Manual Testing
```bash
nvim -c "colorscheme darcula-dark"   # Test colorscheme
nvim -c "luafile lua/test.lua"       # Run test script
```

## Code Style Guidelines

### Formatting (.stylua.toml)
- **Line width:** 120 characters max
- **Indentation:** 2 spaces (no tabs)
- **Line endings:** Unix (LF)
- **Quotes:** Double quotes preferred

### Module Pattern
```lua
---@class MyModule
local M = {}

---@type Config
M.config = {}

M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

return M
```

### Naming Conventions
| Element | Convention | Example |
|---------|------------|---------|
| Functions | `snake_case` | `configure_highlights()` |
| Variables | `snake_case` | `light_blue`, `golden_yellow` |
| Modules | Single uppercase | `local M = {}` |
| API shortcuts | Short lowercase | `local hi = vim.api.nvim_set_hl` |
| Colors | `color.descriptive_name` | `color.burnt_orange` |
| Legacy colors | `color.<descriptive_name>` | `color.very_dark_gray` (avoid adding new) |

### Type Annotations
Use LuaLS/EmmyLua annotations:
```lua
---@class Config
---@field opt string Your config option

---@param args Config?
M.setup = function(args)
```

### Color Definitions
Colors are defined in a single `color` table at the top of `lua/darcula.lua`:
```lua
local color = {
  green = "#98be65",
  light_blue = "#b3deef",
  burnt_orange = "#CC7832",
}
```
- Use descriptive `snake_case` names for new colors
- Avoid numbered colors (`_NN` is legacy)
- Use hex format (`#RRGGBB`)

### Highlight Definitions
Use `hi` shorthand for `vim.api.nvim_set_hl`:
```lua
local hi = vim.api.nvim_set_hl

hi(0, "Normal", { bg = color.dark, fg = color.grey })
hi(0, "TSComment", { fg = color.comment, italic = true })
hi(0, "@lsp.type.keyword.go", { link = "TSKeyword" })
hi(0, "DiagnosticUnderlineError", { sp = color.red, undercurl = true })
```

### Highlight Organization in `configure_highlights()`
1. LSP semantic tokens (`@lsp.*`, `@attribute`, etc.)
2. Basic vim highlights (`Bold`, `Boolean`, etc.)
3. Plugin-specific highlights (nvim-cmp, dap, telescope, etc.)
4. Treesitter highlights (`TS*`)
5. Terminal colors (`terminal_color_N`)

## Adding Plugin Support

1. Find the plugin's highlight group names (check plugin docs/source)
2. Add highlights to `configure_highlights()` in appropriate section
3. Use existing colors from `color` table when possible
4. Add a comment header:
```lua
-- plugin-name.nvim
hi(0, "PluginHighlight1", { fg = color.light_blue })
```
5. Update "Supported Plugins" list in README.md

## Important Files
| File | Purpose |
|------|---------|
| `lua/darcula.lua` | Core implementation - edit for highlight changes |
| `colors/darcula-dark.lua` | Entry point - calls `require("darcula").setup()` |
| `.stylua.toml` | Formatter config |

## CI/CD Workflows
- **lint-test.yml**: Runs Stylua check and tests on push/PR
- **release.yml**: Publishes to LuaRocks on version tags (`v*`)
- **docs.yml**: Auto-generates vimdoc from README

## Requirements
- **Neovim:** v0.8.3+ (uses LSP semantic tokens)
- **Dependencies:** nvim-treesitter

## Common Tasks
```bash
stylua lua                                    # Fix formatting
nvim -c "colorscheme darcula-dark" file.lua   # Test changes
git tag v1.x.x && git push origin v1.x.x      # Create release
```
