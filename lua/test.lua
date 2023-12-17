vim.cmd("highlight clear")
vim.g.colors_name = "darcula-dark"
vim.o.termguicolors = true
local darcula = require("darcula")
darcula.configure_highlights()
