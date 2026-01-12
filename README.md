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

## TODO
- [ ] support Darcula Solid Theme https://plugins.jetbrains.com/plugin/13920-darcula-solid-theme
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
vim.cmd.colorscheme("darcula-dark")

```

### VimScript

```vimscript
colorscheme darcula-dark
```

## Requirements

This color scheme requires Neovim v0.8.3 or higher, as it uses LSP Semantic tokens. It also depends on nvim-treesitter/nvim-treesitter.

## Troubleshooting

Make sure your terminal supports true color: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6

## Alternatives

-  [doums/darcula](https://github.com/doums/darcula)
-  [santos-gabriel-dario/darcula-solid.nvim](https://github.com/santos-gabriel-dario/darcula-solid.nvim)

## Credits

-   [Darcula Darker Theme from JetBrains](https://plugins.jetbrains.com/plugin/12692-darcula-darker-theme)
-   [Neovim Plugin Template by ellisonleao](https://github.com/ellisonleao/nvim-plugin-template)
-   [nvim-base16](https://github.com/RRethy/nvim-base16)
