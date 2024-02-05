local M = {}

---Define the file path by concatenating the home directory with the relative path.
---@type string file_path The path to the themes.css file.
local file_path = os.getenv('HOME') .. '/.config/waybar/themes/theme.css'

M.wb_colors = {}

---Function to read the file and extract the values of 'main-fg' and 'wb-act-bg'.
---Opens the file for reading and reads line by line to find the color definitions.
---@return table
local function extract_colors()
  ---Open the file for reading
  -- @type file*
  local file = io.open(file_path, 'r')
  if not file then
    print('Failed to open file: ' .. file_path)
    return {}
  end

  for line in file:lines() do
    --- Try to match the pattern for 'main-fg' color definition
    ---@type string
    local main_fg = line:match('@define%-color main%-fg (%S+);')
    if main_fg then M.wb_colors.main_fg = main_fg end

    --- Try to match the pattern for 'main-bg' color definition
    ---@type string
    local main_bg = line:match('@define%-color main%-bg (%S+);')
    if main_bg then M.wb_colors.main_bg = main_bg end

    --- Try to match the pattern for 'wb-act-bg' color definition
    ---@type string
    local active_bg = line:match('@define%-color wb%-act%-bg (%S+);')
    if active_bg then M.wb_colors.active_bg = active_bg end

    -- Break the loop if all values are found
    if
      M.wb_colors.main_fg
      and M.wb_colors.main_bg
      and M.wb_colors.active_bg
    then
      break
    end
  end

  file:close()
end

extract_colors()

-- TODO: push list of themes if no hyprdots
function M.get_theme_from_hypr()
  local hypr_conf_path = os.getenv('HOME') .. '/.config/hypr/themes/theme.conf'
  local hypr_conf_file = io.open(hypr_conf_path, 'r')

  if hypr_conf_file then
    local hypr_conf_content = hypr_conf_file:read('*all')
    hypr_conf_file:close()

    ---@type string
    local extracted_theme

    for line in hypr_conf_content:gmatch('[^\n]+') do
      if
        line:match(
          '^exec = gsettings set org.gnome.desktop.interface gtk%-theme'
        )
      then
        extracted_theme = line:match("'([^']+)'.*$")
        break
      end
    end

    return extracted_theme
  else
    print('Config file not found')
    return nil
  end
end

return M
