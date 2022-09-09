local function fold_content()
  local keep_indentation = true
  local fill_char = ' '
  local add_close_pattern = true
  local matchup_patterns = { { '{', '}' }, { '%(', ')' }, { '%[', ']' } }
  local content = vim.fn.getline(vim.v.foldstart)

  if type(add_close_pattern) == 'boolean' and add_close_pattern then
    local str = content
    local found_patterns = {}
    for _, pat in ipairs(matchup_patterns) do
      local found = {}
      local start, stop = nil, 0
      while stop do
        start, stop = str:find(pat[1], stop + 1)
        if start then
          table.insert(
            found,
            { start = start, stop = stop, pat = pat[1], oppening = true }
          )
        end
      end
      for _, f in ipairs(found) do
        str = table.concat({
          str:sub(1, f.start - 1),
          string.rep('Q', f.stop - f.start + 1),
          str:sub(f.stop + 1),
        })
      end
      local num_op = #found
      if num_op > 0 then
        start, stop = nil, 0
        while stop do
          start, stop = str:find(vim.pesc(pat[2]), stop + 1)
          if start then
            table.insert(
              found,
              { start = start, stop = stop, pat = pat[2], oppening = false }
            )
          end
          if #found - num_op == num_op then break end
        end
      end
      if num_op > 0 and num_op ~= #found then
        table.sort(
          found,
          function(a, b) return a.start < b.start and true or false end
        )
        local p, c, n = nil, 1, 2
        while true do
          if found[c].pat == pat[1] and found[n].pat == pat[2] then
            table.remove(found, n)
            table.remove(found, c)
            if p then
              c, n = p, c
              p = p > 1 and p - 1 or nil
            end
          else
            c, n = c + 1, n + 1
            p = (p or 0) + 1
          end
          if n > #found then break end
        end
      end
      for _, f in ipairs(found) do
        table.insert(
          found_patterns,
          { pat = pat, pos = f.start, oppening = f.oppening }
        )
      end
    end
    table.sort(
      found_patterns,
      function(a, b) return a.pos < b.pos and true or false end
    )
    while true do
      if found_patterns[1] and not found_patterns[1].oppening then
        table.remove(found_patterns, 1)
      else
        break
      end
    end
    if not vim.tbl_isempty(found_patterns) then
      local closing_comment_str
      local ellipsis = ' ... '
      str = { content, ellipsis }
      for i = #found_patterns, 1, -1 do
        table.insert(str, found_patterns[i].pat[2])
      end
      if closing_comment_str then table.insert(str, closing_comment_str) end
      content = table.concat(str)
      local brackets = {
        { '{ %.%.%. }', '{...}' },
        { '%( %.%.%. %)', '(...)' },
        { '%[ %.%.%. %]', '[...]' },
        { '< %.%.%. >', '<...>' },
      }
      for _, b in ipairs(brackets) do
        content = content:gsub(b[1], b[2])
      end
    end
  elseif add_close_pattern == 'last_line' then
    local last_line = vim.fn.getline(vim.v.foldend)
    last_line = vim.trim(last_line)
    for _, p in ipairs(matchup_patterns) do
      if content:find(p[1]) and last_line:find(p[2]) then
        local ellipsis = (#p[2] == 1) and '...' or ' ... '
        local closing_comment_str = ''
        content =
          table.concat({ content, ellipsis, last_line, closing_comment_str })
        break
      end
    end
  end
  content = content:gsub('\t', string.rep(' ', vim.bo.tabstop))
  if keep_indentation then
    local opening_blank_substr = content:match('^%s%s+')
    if opening_blank_substr then
      content = content:gsub(
        opening_blank_substr,
        fill_char:rep(#opening_blank_substr - 1) .. ' ',
        -- config.fill_char:rep(fn.strdisplaywidth(opening_blank_substr) - 1)..' ',
        1
      )
    end
  else
    content = content:gsub('^%s*', ' ')
  end
  content = content:gsub('%s*$', '')
  content = content .. ' '
  for blank_substr in content:gmatch('%s%s%s+') do
    content = content:gsub(
      blank_substr,
      ' ' .. string.rep(fill_char, #blank_substr - 2) .. ' ',
      1
    )
  end
  return content
end

local function number_of_folded_lines()
  local lines = string.format('%d lines ', vim.v.foldend - vim.v.foldstart + 1)
  return lines
end

local function percentage()
  local folded_lines = vim.v.foldend - vim.v.foldstart + 1
  local total_lines = vim.api.nvim_buf_line_count(0)
  local pnum = math.floor(100 * folded_lines / total_lines)
  if pnum == 0 then
    pnum = tostring(100 * folded_lines / total_lines):sub(2, 3)
  elseif pnum < 10 then
    pnum = ' ' .. pnum
  end
  return pnum .. '% '
end

return {
  percentage = percentage,
  number_of_folded_lines = number_of_folded_lines,
  content = fold_content,
}
