---Checks border value in the NEVIRAIDE configuration
---file and return table with border settings.
---@param text? table required for LSP rename
return function(text)
  ---@type string
  local border_in_config = NEVIRAIDE().border

  local border_line = { 'rounded', 'single', 'double', 'solid' }

  -- TODO: look for pattern
  for _, line in pairs(border_line) do
    if border_in_config == line then
      if text then
        return {
          border = {
            style = border_in_config,
            text = text,
            padding = { 0, 1 },
          },
        }
      end
      return {
        border = {
          style = border_in_config,
          padding = { 0, 1 },
        },
      }
    else
      return {
        border = {
          style = border_in_config,
          padding = { 1, 2 },
        },
        win_options = {
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        },
      }
    end
  end
end
