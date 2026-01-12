---@class DarculaHealth
local M = {}

---Check if Neovim version is compatible
local function check_neovim_version()
  if vim.fn.has("nvim-0.8.3") == 1 then
    vim.health.ok(
      "Neovim >= 0.8.3 found: version "
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
    )
  else
    vim.health.error("Neovim >= 0.8.3 required for LSP semantic tokens support")
  end
end

---Detect terminal type from environment
---@return string|nil terminal Terminal name or nil
local function detect_terminal()
  local term_program = vim.env.TERM_PROGRAM
  local term = vim.env.TERM

  if term_program == "tmux" then
    return "tmux"
  elseif term and term:match("^alacritty") then
    return "alacritty"
  elseif term and term:match("^kitty") then
    return "kitty"
  elseif term and term:match("^tmux") then
    return "tmux"
  elseif term and term:match("^screen") then
    return "screen"
  elseif term and term:match("^xterm") then
    return "xterm"
  end

  return term
end

---Get terminal-specific configuration advice
---@param terminal string Terminal name
---@return table advice Configuration advice
local function get_terminal_advice(terminal)
  local advice = {
    tmux = {
      title = "tmux configuration",
      config_file = "~/.tmux.conf or ~/.config/tmux/tmux.conf",
      settings = {
        'set -g default-terminal "tmux-256color"',
        'set -ag terminal-overrides ",xterm-256color:RGB"',
        "",
        "# Or use a wildcard:",
        '#set -sg terminal-overrides ",*:RGB"',
      },
    },
    alacritty = {
      title = "Alacritty configuration",
      config_file = "~/.config/alacritty/alacritty.yml or alacritty.toml",
      settings = {
        "# For YAML config (alacritty.yml):",
        "env:",
        "  TERM: xterm-256color",
        "",
        "# For TOML config (alacritty.toml):",
        "[env]",
        'TERM = "xterm-256color"',
      },
    },
    kitty = {
      title = "Kitty configuration",
      config_file = "~/.config/kitty/kitty.conf",
      settings = {
        "# Kitty supports true colors by default",
        "# Ensure TERM is not overridden incorrectly",
      },
    },
    xterm = {
      title = "xterm configuration",
      config_file = "~/.Xresources or terminal settings",
      settings = {
        "# Ensure your xterm supports 256 colors:",
        "XTerm*termName: xterm-256color",
        "",
        "# Or use a modern terminal emulator that supports true colors",
      },
    },
  }

  return advice[terminal]
    or {
      title = "Terminal configuration",
      config_file = "your terminal configuration file",
      settings = {
        "# Ensure your terminal supports true colors (24-bit)",
        "# Set TERM appropriately (e.g., xterm-256color)",
      },
    }
end

---Check true color support
local function check_truecolor_support()
  local has_termguicolors = vim.fn.has("termguicolors") == 1
  local termguicolors_enabled = vim.o.termguicolors
  local colorterm = vim.env.COLORTERM
  local term = vim.env.TERM

  -- Check if termguicolors capability exists
  if has_termguicolors then
    vim.health.ok("Terminal supports termguicolors capability")
  else
    vim.health.warn("Terminal may not support termguicolors", {
      "Your terminal might not support 24-bit true colors",
      "Consider using a modern terminal emulator (alacritty, kitty, etc.)",
      "See: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6",
    })
  end

  -- Check if termguicolors is enabled
  if termguicolors_enabled then
    vim.health.ok("termguicolors is enabled")
  else
    vim.health.warn("termguicolors is not enabled", {
      "True colors (24-bit) will not work without this setting",
      "Add to your config: vim.o.termguicolors = true",
      "",
      "Would you like to enable it now? Run in Neovim:",
      "  :lua vim.o.termguicolors = true",
      "",
      "To make it permanent, add to your init.lua:",
      "  vim.o.termguicolors = true",
      "Or init.vim:",
      "  set termguicolors",
    })
  end

  -- Check COLORTERM environment variable
  if colorterm == "truecolor" or colorterm == "24bit" then
    vim.health.ok("$COLORTERM is set correctly: " .. colorterm)
  else
    local term_type = detect_terminal()
    if colorterm then
      vim.health.info("$COLORTERM is set to: " .. colorterm)
    else
      vim.health.info("$COLORTERM is not set")
    end

    if term_type == "tmux" or term_type == "screen" then
      vim.health.info("Running inside " .. term_type .. " - this is normal, check tmux configuration")
    end
  end

  -- Check and provide terminal-specific advice
  local terminal = detect_terminal()
  if terminal then
    vim.health.info("Detected terminal: " .. terminal)

    -- Check TERM value
    if term then
      if term:match("256color") or term == "alacritty" or term == "kitty" then
        vim.health.ok("$TERM supports colors: " .. term)
      else
        vim.health.warn("$TERM may not support true colors: " .. term, {
          "Consider setting TERM to a value that supports 256 colors",
          "Example: xterm-256color, tmux-256color, alacritty",
        })
      end

      -- Provide terminal-specific configuration advice
      local advice = get_terminal_advice(terminal)
      if advice and (terminal == "tmux" or not term:match("256color")) then
        local advice_lines = { "Add to " .. advice.config_file .. ":" }
        for _, line in ipairs(advice.settings) do
          table.insert(advice_lines, "  " .. line)
        end
        table.insert(advice_lines, "")
        table.insert(advice_lines, "See: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6")

        if terminal == "tmux" and term:match("tmux") then
          vim.health.info("tmux detected - verify terminal-overrides configuration", advice_lines)
        elseif not term:match("256color") and terminal ~= "kitty" then
          vim.health.warn("Terminal configuration may need adjustment", advice_lines)
        end
      end
    else
      vim.health.warn("$TERM is not set")
    end
  end
end

---Check terminal configuration
local function check_terminal_config()
  local term = vim.env.TERM
  local term_program = vim.env.TERM_PROGRAM

  -- Warn about setting TERM in shell config
  if term_program and term_program ~= "tmux" then
    vim.health.info("Terminal program: " .. term_program)
  end

  -- Check for common misconfigurations
  if term == "xterm" or term == "screen" then
    vim.health.warn("Basic TERM value detected: " .. term, {
      "You may experience color issues with basic TERM values",
      "Consider using " .. term .. "-256color instead",
      "Set this in your terminal emulator config, NOT in your shell (zshrc/bashrc)",
    })
  end
end

---Check dependencies
local function check_dependencies()
  -- Check for nvim-treesitter
  local has_treesitter = pcall(require, "nvim-treesitter")
  if has_treesitter then
    vim.health.ok("nvim-treesitter is installed")
  else
    vim.health.warn("nvim-treesitter is not installed", {
      "This plugin requires nvim-treesitter for proper syntax highlighting",
      "Install it via your plugin manager:",
      "  Lazy: { 'nvim-treesitter/nvim-treesitter' }",
      "  Packer: use 'nvim-treesitter/nvim-treesitter'",
    })
  end
end

---Check theme loading
local function check_theme_loading()
  -- Try to load the theme loader
  local loader_ok, loader = pcall(require, "darcula.theme_loader")
  if not loader_ok then
    vim.health.error("Failed to load theme loader module", {
      "Error: " .. tostring(loader),
    })
    return
  end

  -- Try to load default colors
  local colors_ok, colors = pcall(require, "darcula.default_colors")
  if colors_ok then
    local color_count = vim.tbl_count(colors)
    vim.health.ok("Default color palette loaded (" .. color_count .. " colors)")
  else
    vim.health.error("Failed to load default color palette", {
      "Error: " .. tostring(colors),
    })
  end

  -- Check if colors_name is set
  if vim.g.colors_name then
    vim.health.ok("Active colorscheme: " .. vim.g.colors_name)
  else
    vim.health.info("No colorscheme currently active")
  end
end

---Run all health checks
M.check = function()
  vim.health.start("darcula.nvim")

  check_neovim_version()
  check_truecolor_support()
  check_terminal_config()
  check_dependencies()
  check_theme_loading()

  vim.health.info("For more information about true color support:", {
    "https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6",
  })
end

return M
