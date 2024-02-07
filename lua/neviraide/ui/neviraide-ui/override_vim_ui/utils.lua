local function get_prompt_text(prompt, default_prompt)
  local prompt_text = prompt or default_prompt
  if prompt_text:sub(-1) == ':' then
    prompt_text = ' ' .. prompt_text:sub(1, -2) .. ' '
  end
  return prompt_text
end

---@return table
local function popup_bg()
  local vgb = vim.g.b
  local opts = {
    winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
  }
  if vgb == 'solid' then
    opts.winhighlight = opts.winhighlight .. ',FloatTitle:NuiTitle'
  end
  return opts
end

---Checks border value in the NEVIRAIDE configuration
---file and return table with border settings.
---@param text? table required for LSP rename
local function nui_border(text)
  local vgb = vim.g.b
  local border = {
    style = vgb,
    padding = { 0, 1 },
  }
  local border_line = { 'rounded', 'single', 'double', 'solid' }
  for i in pairs(border_line) do
    if vgb == border_line[i] then
      if text then border.text = text end
    end

    if vgb == 'none' or vgb == 'shadow' then
      border.padding[1] = 1
      border.padding[2] = 2
    end
  end
  return border
end

return {
  get_prompt_text = get_prompt_text,
  popup_bg = popup_bg,
  nui_border = nui_border,
}
