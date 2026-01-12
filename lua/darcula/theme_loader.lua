---@class ThemeLoader
local M = {}

---Resolve theme path
---@param theme_name_or_path string Theme name or file path
---@return string|nil path Resolved file path or nil
---@return string|nil error Error message if failed
local function resolve_path(theme_name_or_path)
  -- If it's an absolute path
  if theme_name_or_path:sub(1, 1) == "/" then
    return theme_name_or_path, nil
  end

  -- If it starts with ~, expand home directory
  if theme_name_or_path:sub(1, 1) == "~" then
    local home = vim.fn.expand("~")
    return home .. theme_name_or_path:sub(2), nil
  end

  -- If it has .json extension, treat as relative path
  if theme_name_or_path:match("%.json$") then
    return vim.fn.expand(theme_name_or_path), nil
  end

  -- Otherwise, treat as built-in theme name
  local script_path = debug.getinfo(1, "S").source:sub(2)
  local plugin_root = vim.fn.fnamemodify(script_path, ":h:h:h")
  local theme_path = plugin_root .. "/colors/themes/" .. theme_name_or_path .. ".json"

  return theme_path, nil
end

---Validate color format (#RRGGBB)
---@param color string Color value to validate
---@return boolean valid
local function is_valid_color(color)
  if type(color) ~= "string" then
    return false
  end
  return color:match("^#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]$") ~= nil
end

---Validate theme structure
---@param theme table Parsed theme table
---@return boolean valid
---@return string|nil error
local function validate_theme(theme)
  if type(theme) ~= "table" then
    return false, "Theme must be a table"
  end

  if not theme.colors or type(theme.colors) ~= "table" then
    return false, "Theme must have a 'colors' table"
  end

  -- Validate color formats (warn but don't fail)
  local invalid_colors = {}
  for name, color in pairs(theme.colors) do
    if not is_valid_color(color) then
      table.insert(invalid_colors, name)
    end
  end

  if #invalid_colors > 0 then
    vim.notify("Warning: Invalid color format for: " .. table.concat(invalid_colors, ", "), vim.log.levels.WARN)
  end

  return true, nil
end

---Load a JSON theme file
---@param theme_name_or_path string Theme name or file path
---@return table|nil colors Color table or nil on error
---@return string|nil error Error message if failed
M.load = function(theme_name_or_path)
  -- Resolve the path
  local path, err = resolve_path(theme_name_or_path)
  if err then
    return nil, err
  end

  -- Check if file exists
  local file = io.open(path, "r")
  if not file then
    return nil, "Theme file not found: " .. path
  end

  -- Read file content
  local content = file:read("*all")
  file:close()

  -- Parse JSON
  local ok, theme = pcall(vim.json.decode, content)
  if not ok then
    return nil, "Failed to parse JSON: " .. tostring(theme)
  end

  -- Validate theme structure
  local valid, validation_err = validate_theme(theme)
  if not valid then
    return nil, validation_err
  end

  return theme.colors, nil
end

return M
