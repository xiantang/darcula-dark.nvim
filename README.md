Darcula Dark for NeoVim
=======================

The Darcula Dark theme is a NeoVim colorscheme that's designed to emulate the popular Darcula color scheme from JetBrains' GoLand IDE. It is ideal for long hours of coding, offering a dark theme that's easy on the eyes. Despite trying various alternatives in NeoVim, we found nothing quite matched up, hence we embarked on creating this color scheme ourselves.

Installation
------------

To install this color scheme, add the following to your plugin configuration:

lazy install

```lua
{
	"xiantang/darcula-dark.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
```
Requirements
------------

This color scheme requires NeoVim v0.8.3 or higher, as it uses LSP Semantic tokens. It also depends on nvim-treesitter/nvim-treesitter.

Credits
-------

-   [Darcula Darker Theme from JetBrains](https://plugins.jetbrains.com/plugin/12692-darcula-darker-theme)
-   [NeoVim Plugin Template by ellisonleao](https://github.com/ellisonleao/nvim-plugin-template)
