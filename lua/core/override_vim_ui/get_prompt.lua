local function get_prompt_text(prompt, default_prompt)
  local prompt_text = prompt or default_prompt
  if prompt_text:sub(-1) == ':' then
    prompt_text = ' ' .. prompt_text:sub(1, -2) .. ' '
  end
  return prompt_text
end

return get_prompt_text
