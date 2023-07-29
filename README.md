Darcula Dark for Neovim
=======================

The Darcula Dark theme is a Neovim colorscheme that's designed to emulate the popular Darcula color scheme from JetBrains' GoLand IDE. It is ideal for long hours of coding, offering a dark theme that's easy on the eyes. Despite trying various alternatives in Neovim, we found nothing quite matched up, hence we embarked on creating this color scheme ourselves.

![image](https://user-images.githubusercontent.com/34479567/256968343-f88d8263-76d3-4e2e-a746-8a572d4522ca.png)

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

Usage
------------


lua 

```lua
vim.cmd.colorscheme("darcula-dark")

```

vimscript

```vimscript
colorscheme darcula-dark
```


Requirements
------------

This color scheme requires Neovim v0.8.3 or higher, as it uses LSP Semantic tokens. It also depends on nvim-treesitter/nvim-treesitter.


Alternatives
------------

-  [doums/darcula](https://github.com/doums/darcula)
-  [santos-gabriel-dario/darcula-solid.nvim](https://github.com/santos-gabriel-dario/darcula-solid.nvim)



Credits
-------

-   [Darcula Darker Theme from JetBrains](https://plugins.jetbrains.com/plugin/12692-darcula-darker-theme)
-   [Neovim Plugin Template by ellisonleao](https://github.com/ellisonleao/nvim-plugin-template)
-   [nvim-base16](https://github.com/RRethy/nvim-base16)
