local utils = require('neviraide.utils')

-- TODO: create func for borderless theme
local function invert_highlights(highligh) return end

utils.autocmd('NEVIRAIDE_HIGHLIGHTS', 'ColorScheme', {
  pattern = '*',
  callback = function()
    local no_line = { 'none', 'shadow' }
    local border_line = { 'rounded', 'single', 'double', 'solid' }

    for _, line in pairs(border_line) do
      if NEVIRAIDE().border == line then
        utils.hi('NormalFloat', { bg = 'none' })
        utils.hi('FloatBorder', { bg = 'none' })

        utils.hi('TelescopeNormal', { link = 'NormalFloat' })
        utils.hi('TelescopeBorder', { link = 'FloatBorder' })
      end
    end

    for _, line in pairs(no_line) do
      if NEVIRAIDE().border == line then
        utils.hi('FloatBorder', { link = 'NormalFloat' })
        utils.hi('NotifyBackground', { link = 'NormalFloat' })

        utils.hi('NotifyERRORBody', { link = 'NormalFloat' })
        utils.hi('NotifyWARNBody', { link = 'NormalFloat' })
        utils.hi('NotifyINFOBody', { link = 'NormalFloat' })
        utils.hi('NotifyTRACEBody', { link = 'NormalFloat' })
        utils.hi('NotifyDEBUGBody', { link = 'NormalFloat' })

        utils.hi('NotifyERRORBorder', { link = 'NormalFloat' })
        utils.hi('NotifyWARNBorder', { link = 'NormalFloat' })
        utils.hi('NotifyINFOBorder', { link = 'NormalFloat' })
        utils.hi('NotifyTRACEBorder', { link = 'NormalFloat' })
        utils.hi('NotifyDEBUGBorder', { link = 'NormalFloat' })

        -- utils.hi('NotifyERRORTitle', { bg = fg, fg = bg })
        -- utils.hi('NotifyINFOTitle', { bg = 'NotifyINFOIcon' })
        -- utils.hi('NotifyWARNTitle', { link = 'NormalFloat' })
        -- utils.hi('NotifyTRACETitle', { link = 'NormalFloat' })
        -- utils.hi('NotifyDEBUGTitle', { link = 'NormalFloat' })
      end
    end

    utils.hi('LspCodeLens', { fg = 'Grey' })
    utils.hi('LspCodeLensSeparator', { link = 'Boolean' })
  end,
})
