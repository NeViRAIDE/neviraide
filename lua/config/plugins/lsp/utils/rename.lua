local Input = require('nui.input')
local event = require('nui.utils.autocmd').event

function _G.customRename()
  local curr_name = vim.fn.expand('<cword>')

  local params = vim.lsp.util.make_position_params()

  local function on_submit(new_name)
    if not new_name or #new_name == 0 or curr_name == new_name then return end

    params.newName = new_name

    vim.lsp.buf_request(
      0,
      'textDocument/rename',
      params,
      function(_, result, ctx, _)
        if not result then return end

        local total_files =
          vim.tbl_count(result.changes or result.documentChanges or {})

        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)

        require('notify').notify(
          'Changed ' .. total_files .. " file. To save press 'Ctrl + s'",
          'info'
        )
      end
    )
  end

  local input = Input({
    border = {
      style = 'rounded',
      highlight = 'String',
      text = {
        top = ' Rename ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    highlight = 'Normal:Normal',
    relative = 'cursor',
    position = {
      row = 1,
      col = 0,
    },
    size = {
      width = 25,
      height = 1,
    },
  }, {
    prompt = '',
    default_value = curr_name,
    on_submit = on_submit,
  })

  input:mount()

  input:on(event.BufLeave, input.input_props.on_close, { once = true })

  input:map('n', '<esc>', input.input_props.on_close, { noremap = true })
end
