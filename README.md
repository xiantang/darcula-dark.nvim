# 🧛🏻‍♂️ Darcula Dark for Neovim

The Darcula Dark theme is a Neovim colorscheme that's designed to emulate the popular Darcula color scheme from JetBrains' GoLand IDE. It is ideal for long hours of coding, offering a dark theme that's easy on the eyes. Despite trying various alternatives in Neovim, we found nothing quite matched up, hence we embarked on creating this color scheme ourselves.

![image](https://github.com/xiantang/darcula-dark.nvim/blob/main/img/preview.png?raw=true)

comparing with the original Darcula theme in GoLand:

![image](https://github.com/xiantang/darcula-dark.nvim/blob/main/img/256969805-1d3f86f1-3692-4267-a113-56a76be67e99.png?raw=true)

## Installation

To install this color scheme, add the following to your plugin configuration:

### lazy.nvim

```lua
{
    "xiantang/darcula-dark.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}
```


### Customization

You can customize darcula-dark in several ways:

#### Option 1: Disable plugin integrations

```lua
return {
	{
		"xiantang/darcula-dark.nvim",
		config = function()
			-- setup must be called before loading
			require("darcula").setup({
				opt = {
					integrations = {
						telescope = false,
						snacks = true,
						lualine = true,
						lsp_semantics_token = true,
						nvim_cmp = true,
						dap_nvim = true,
					},
				},
			})
		end,
	},
}
```

#### Option 2: Override specific colors

```lua
require("darcula").setup({
	override = function(c)
		return {
			background = "#333333",
			dark = "#000000"
		}
	end,
})
```

#### Option 3: Use custom theme file (NEW!)

You can create your own theme JSON file and load it:

```lua
require("darcula").setup({
	theme = "darcula"  -- loads built-in colors/themes/darcula.json
})

-- Use Darcula Solid theme (darker backgrounds, flatter UI)
require("darcula").setup({
	theme = "darcula-solid"  -- loads built-in colors/themes/darcula-solid.json
})

-- Use Dracula theme (official Dracula spec-compliant theme)
require("darcula").setup({
	theme = "dracula"  -- loads built-in colors/themes/dracula.json
})

-- Or load from custom path
require("darcula").setup({
	theme = "~/.config/nvim/themes/my-darcula.json"
})

-- Combine theme with override
require("darcula").setup({
	theme = "darcula",
	override = function(c)
		return { background = "#1E1E1E" }
	end
})
```

### Creating Custom Themes

You can create your own theme by making a JSON file with the following structure:

```json
{
  "name": "my-custom-theme",
  "version": "1.0.0",
  "colors": {
    "green": "#98be65",
    "red": "#f43753",
    "dark": "#2B2B2B",
    ...
  }
}
```

**Key points:**
- The `colors` object must contain color definitions in `#RRGGBB` hex format
- You can define only the colors you want to override (partial themes are supported)
- Missing colors will fall back to default values
- See `colors/themes/darcula.json` for a complete reference of all available color names

**Color names reference:**
Primary colors: `green`, `red`, `grey`, `dark`, `background`, etc.
See the full list in `colors/themes/darcula.json`




### packer.nvim

```lua
  use {
    'xiantang/darcula-dark.nvim',
    requires = {"nvim-treesitter/nvim-treesitter"}
  }

```

## Built-in Themes

* **darcula** - The original Darcula theme (default)
* **darcula-solid** - Darcula Solid theme with darker backgrounds and flatter UI
* **dracula** - Official Dracula theme ([spec-compliant](https://spec.draculatheme.com/))

## TODO
- [x] support Darcula Solid Theme https://plugins.jetbrains.com/plugin/13920-darcula-solid-theme
- [x] support Dracula Theme https://spec.draculatheme.com/
- [ ] support more plugins

## Supported Plugins

* telescope
* Treesitter
* cmp-nvim
* copilot.vim
* dap.nvim
* eyeline.nvim
* gitsign.nvim
* hop.nvim
* nerdtree.vim
* lspsaga.nvim
* scrollbar.nvim
* lualine.nvim
* snacks.nvim

## Usage

### Lua

```lua
-- Use default Darcula theme
vim.cmd.colorscheme("darcula-dark")

-- Use Darcula Solid theme
vim.cmd.colorscheme("darcula-solid")

-- Use Dracula theme
vim.cmd.colorscheme("dracula")
```

### VimScript

```vimscript
" Use default Darcula theme
colorscheme darcula-dark

" Use Darcula Solid theme
colorscheme darcula-solid

" Use Dracula theme
colorscheme dracula
```

## Requirements

This color scheme requires Neovim v0.8.3 or higher, as it uses LSP Semantic tokens. It also depends on nvim-treesitter/nvim-treesitter.

## Health Check

Run `:checkhealth darcula` to verify your setup and troubleshoot any issues:

```vim
:checkhealth darcula
```

The health check will verify:
- ✅ Neovim version compatibility (>= 0.8.3)
- ✅ True color (24-bit) support detection
- ✅ Terminal configuration ($TERM, $COLORTERM)
- ✅ `termguicolors` setting
- ✅ Required dependencies (nvim-treesitter)
- ✅ Theme loading status
- 💡 Terminal-specific configuration advice (tmux, alacritty, kitty, etc.)

### Auto-fix for termguicolors

If the health check reports that `termguicolors` is not enabled, you can:

**Temporary fix (current session):**
```vim
:lua vim.o.termguicolors = true
```

**Permanent fix - add to your config:**

Lua (`init.lua`):
```lua
vim.o.termguicolors = true
```

VimScript (`init.vim`):
```vim
set termguicolors
```

## Troubleshooting

If you're experiencing color issues:

1. **Run the health check first**: `:checkhealth darcula`
2. **Test your terminal's true color support**: 
   ```bash
   curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash
   ```
   You should see smooth color gradients. If not, your terminal needs configuration.

3. **Common issues and solutions**:
   - **Colors look wrong**: Enable `termguicolors` (see health check)
   - **Using tmux**: Add to `~/.tmux.conf`:
     ```bash
     set -g default-terminal "tmux-256color"
     set -ag terminal-overrides ",xterm-256color:RGB"
     ```
   - **Using Alacritty**: Add to `alacritty.yml`:
     ```yaml
     env:
       TERM: xterm-256color
     ```
     Or `alacritty.toml`:
     ```toml
     [env]
     TERM = "xterm-256color"
     ```

4. **Complete terminal setup guide**: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6

## Alternatives

-  [doums/darcula](https://github.com/doums/darcula)
-  [santos-gabriel-dario/darcula-solid.nvim](https://github.com/santos-gabriel-dario/darcula-solid.nvim)

## Credits

-   [Darcula Darker Theme from JetBrains](https://plugins.jetbrains.com/plugin/12692-darcula-darker-theme)
-   [Neovim Plugin Template by ellisonleao](https://github.com/ellisonleao/nvim-plugin-template)
-   [nvim-base16](https://github.com/RRethy/nvim-base16)
