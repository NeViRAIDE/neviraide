local function get_prompt_text(prompt, default_prompt)
  local prompt_text = prompt or default_prompt
  if prompt_text:sub(-1) == ':' then
    prompt_text = ' ' .. prompt_text:sub(1, -2) .. ' '
  end
  return prompt_text
end

---@param border function
---@return table
local function popup_bg(border)
  if border().win_options == nil then
    return {
      winhighlight = 'NormalFloat:NoiceCmdlinePopupBorder,FloatBorder:NoiceCmdlinePopupBorder',
    }
  else
    return {}
  end
end

return { get_prompt_text = get_prompt_text, popup_bg = popup_bg }
